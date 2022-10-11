#
# Cookbook:: chef_auto_accumulator
# Resource:: _config_auto_accumulator_kea
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
          default: lazy { default_kea_config_file },
          desired_state: false

property :load_existing_config_file, [true, false],
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

property :extra_options, Hash,
          coerce: proc { |p| p.transform_keys(&:to_s) }

property :force_replace, [true, false],
          default: false,
          desired_state: false

property :clean_nil_values, [true, false],
          default: false,
          desired_state: false

load_current_value do |new_resource|
  if resource_properties.all? { |rp| nil_or_empty?(new_resource.send(rp)) }
    Chef::Log.warn('No properties are set, skipping load_current_value. Should this resource exist?')
    return
  end

  current_config = case option_config_path_type
                   when :array
                     load_config_file_section_item(new_resource.config_file)
                   when :array_contained
                     load_config_file_section_contained_item(new_resource.config_file)
                   when :hash
                     load_config_file_section(new_resource.config_file)
                   when :hash_contained
                     section = load_config_file_section(new_resource.config_file)
                     section.fetch(option_config_path_contained_key, nil) if section.is_a?(Hash)
                   end.dup

  current_value_does_not_exist! if nil_or_empty?(current_config) || !load_existing_config_file || force_replace

  if ::File.exist?(new_resource.config_file)
    owner ::Etc.getpwuid(::File.stat(new_resource.config_file).uid).name
    group ::Etc.getgrgid(::File.stat(new_resource.config_file).gid).name
    filemode ::File.stat(new_resource.config_file).mode.to_s(8)[-4..-1]
  end

  current_config.transform_keys! { |k| translate_property_key(k).to_sym }
  extra_options_filtered = current_config.reject { |k, _| resource_properties.include?(k) }
  current_config.reject! { |k, _| extra_options_filtered.keys.include?(k) }

  resource_properties.each do |p|
    value = current_config.fetch(p, nil)
    next if value.nil? && !resource_property(:clean_nil_values)

    send(p, value)
  end

  extra_options(extra_options_filtered) unless nil_or_empty?(extra_options_filtered)
end

def auto_accumulator_options
  {
    config_file_type: :json,
    config_base_path: 'isc_kea_config_',
    property_name_gsub: %w(_ -),
  }.freeze
end

action_class do
  include ChefAutoAccumulator
end

action :create do
  converge_if_changed do
    # Perform accumulator configuration action
    case option_config_path_type
    when :array
      accumulator_config(
        action: :array_push,
        value: resource_properties_map,
        force_replace: new_resource.force_replace
      )
    when :array_contained
      ck = accumulator_config_path_containing_key
      accumulator_config(
        action: :key_push,
        key: ck,
        value: resource_properties_map,
        force_replace: new_resource.force_replace
      )
    when :hash
      resource_properties.each do |rp|
        next if new_resource.send(rp).nil?

        accumulator_config(action: :set, key: rp, value: new_resource.send(rp))
      end

      new_resource.extra_options.each { |key, value| accumulator_config(:set, key, value) } if property_is_set?(:extra_options)
    when :hash_contained
      accumulator_config(action: :set, key: option_config_path_contained_key, value: resource_properties_map)
    else
      raise "Unknown config path type #{debug_var_output(option_config_path_type)}"
    end
  end
end

action :delete do
  case option_config_path_type
  when :array
    converge_by("Deleting configuration for #{new_resource.declared_type.to_s} #{new_resource.name}") do
      accumulator_config(action: :array_delete)
    end if config_file_config_present?
  when :array_contained
    converge_by("Deleting configuration for #{new_resource.declared_type.to_s} #{new_resource.name}") do
      accumulator_config(action: :key_delete_match_self, key: accumulator_config_path_containing_key)
    end if config_file_config_present?
  when :hash
    set_properties = resource_properties.push(:extra_options).filter { |rp| property_is_set?(rp) }
    delete_properties = nil_or_empty?(set_properties) ? resource_properties : set_properties
    diff_properties = delete_properties.filter { |dp| load_config_file_section(new_resource.config_file).key?(translate_property_value(dp)) }
    diff_properties.map! { |dp| translate_property_value(dp) }

    if property_is_set?(:extra_options)
      extra_options_diff = new_resource.extra_options.keys.filter { |eo| load_config_file_section(new_resource.config_file).key?(eo) }
      diff_properties.concat(extra_options_diff) unless nil_or_empty?(extra_options_diff)
    end

    converge_by("Deleting configuration for #{diff_properties.join(', ')}") do
      diff_properties.each { |rp| accumulator_config(action: :delete, key: rp) }
    end unless diff_properties.empty?
  when :hash_contained
    converge_by("Deleting configuration for #{new_resource.declared_type.to_s} #{new_resource.name}") do
      accumulator_config(action: :delete, key: option_config_path_contained_key)
    end if config_file_config_present?
  else
    raise "Unknown config path type #{debug_var_output(option_config_path_type)}"
  end
end
