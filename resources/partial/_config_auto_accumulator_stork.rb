#
# Cookbook:: chef_auto_accumulator
# Resource:: _config_auto_accumulator_stork
#
# Copyright:: Ben Hughes <bmhughes@bmhughes.co.uk>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include ChefAutoAccumulator
include IscKea::Cookbook::Helpers

unified_mode true

property :sensitive, [true, false],
          default: false,
          desired_state: false

property :config_file, String,
          required: true,
          default: lazy { default_stork_config_file(declared_type) },
          desired_state: false

property :load_existing_config_file, true,
          default: true,
          desired_state: false

property :cookbook, String,
          default: 'chef_auto_accumulator',
          desired_state: false

property :source, String,
          default: lazy { config_file_template_default },
          desired_state: false

property :owner, String,
          default: 'root'

property :group, String,
          default: 'root'

property :filemode, String,
          default: '0644'

property :sort, [true, false],
          default: false,
          desired_state: false

property :extra_options, Hash,
          coerce: proc { |p| p.transform_keys(&:to_s) }

load_current_value do |new_resource|
  if resource_properties.all? { |rp| nil_or_empty?(new_resource.send(rp)) }
    Chef::Log.warn('No properties are set, skipping load_current_value. Should this resource exist?')
    return
  end

  current_config = case option_config_path_type
                   when :hash
                     load_config_file_section(new_resource.config_file)
                   when :hash_contained
                     section = load_config_file_section(new_resource.config_file)
                     section.fetch(option_config_path_contained_key, nil) if section.is_a?(Hash)
                   when :array
                     load_config_file_section_item(new_resource.config_file)
                   when :array_contained
                     load_config_file_section_contained_item(new_resource.config_file)
                   end

  current_value_does_not_exist! if nil_or_empty?(current_config)

  if ::File.exist?(new_resource.config_file)
    owner ::Etc.getpwuid(::File.stat(new_resource.config_file).uid).name
    group ::Etc.getgrgid(::File.stat(new_resource.config_file).gid).name
    filemode ::File.stat(new_resource.config_file).mode.to_s(8)[-4..-1]
  end

  extra_options_filtered = current_config.reject { |k, _| resource_properties.include?(translate_property_key(k).to_sym) }
  current_config.reject! { |k, _| extra_options_filtered.keys.include?(k) }

  resource_properties.each do |p|
    next if current_config.fetch(translate_property_value(p), nil).nil?

    send(p, current_config.fetch(translate_property_value(p)))
  end

  extra_options(extra_options_filtered) unless nil_or_empty?(extra_options_filtered)
end

def auto_accumulator_options
  {
    config_file_type: :ini,
  }.freeze
end

action_class do
  include ChefAutoAccumulator
end

action :create do
  converge_if_changed do
    case option_config_path_type
    when :array
      map = resource_properties.map do |rp|
        next if new_resource.send(rp).nil?

        [translate_property_value(rp), new_resource.send(rp)]
      end.compact.to_h

      accumulator_config(action: :array_push, value: map)
    when :array_contained
      map = resource_properties.map do |rp|
        next if new_resource.send(rp).nil?

        [translate_property_value(rp), new_resource.send(rp)]
      end.compact.to_h

      ck = accumulator_config_path_contained_nested? ? option_config_path_contained_key.last : option_config_path_contained_key
      accumulator_config(action: :key_push, key: ck, value: map)
    when :hash
      resource_properties.each do |rp|
        next if new_resource.send(rp).nil?

        accumulator_config(action: :set, key: rp, value: new_resource.send(rp))
      end

      new_resource.extra_options.each { |key, value| accumulator_config(:set, key, value) } if property_is_set?(:extra_options)
    when :hash_contained
      map = resource_properties.map do |rp|
        next if new_resource.send(rp).nil?

        [translate_property_value(rp), new_resource.send(rp)]
      end.compact.to_h

      accumulator_config(action: :set, key: option_config_path_contained_key, value: map)
    else
      raise "Unknown config path type #{debug_var_output(option_config_path_type)}"
    end
  end
end

action :delete do
  case option_config_path_type
  when :array
    converge_by("Deleting configuration for #{new_resource.declared_type} #{new_resource.name}") do
      accumulator_config(action: :array_delete_match, key: option_config_path_match_key, value: option_config_path_match_value)
    end if accumulator_config_array_present?
  when :array_contained
    converge_by("Deleting configuration for #{new_resource.declared_type} #{new_resource.name}") do
      accumulator_config(action: :key_delete_match, key: option_config_path_contained_key)
    end if accumulator_config_array_present?
  when :hash
    set_properties = resource_properties.push(:extra_options).filter { |rp| property_is_set?(rp) }
    Chef::Log.warn("SP: #{debug_var_output(set_properties)}")

    delete_properties = nil_or_empty?(set_properties) ? resource_properties : set_properties
    Chef::Log.warn("DP: #{debug_var_output(delete_properties)}")

    diff_properties = delete_properties.filter { |dp| load_config_file_section(new_resource.config_file).key?(translate_property_value(dp)) }
    diff_properties.map! { |dp| translate_property_value(dp) }
    Chef::Log.warn("DFP: #{debug_var_output(diff_properties)}")

    if property_is_set?(:extra_options)
      extra_options_diff = new_resource.extra_options.keys.filter { |eo| load_config_file_section(new_resource.config_file).key?(eo) }
      diff_properties.concat(extra_options_diff) unless nil_or_empty?(extra_options_diff)
    end

    converge_by("Deleting configuration for #{diff_properties.join(', ')}") do
      diff_properties.each { |rp| accumulator_config(action: :delete, key: rp) }
    end unless diff_properties.empty?
  when :hash_contained
    converge_by("Deleting configuration for #{new_resource.declared_type} #{new_resource.name}") do
      accumulator_config(action: :delete, key: option_config_path_contained_key)
    end if accumulator_config_present?(option_config_path_contained_key)
  else
    raise "Unknown config path type #{debug_var_output(option_config_path_type)}"
  end
end
