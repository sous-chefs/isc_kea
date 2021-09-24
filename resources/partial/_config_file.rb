#
# Cookbook:: chef_auto_accumulator
# Resource:: _config_file
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

include ChefAutoAccumulator::Resource

unified_mode true

property :sensitive, [true, false],
          default: false,
          desired_state: false

property :config_directory, String,
          required: true,
          default: '/etc/kea',
          desired_state: false

property :config_file, String,
          required: true,
          coerce: proc { |p| ::File.join(config_directory, p) },
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

property :filetype, [Symbol, String],
          equal_to: %i(json ini toml yaml),
          coerce: proc { |p| p.to_sym }

property :extra_options, Hash,
          coerce: proc { |p| p.transform_keys(&:to_s) }

load_current_value do |new_resource|
  if resource_properties.all? { |rp| nil_or_empty?(new_resource.send(rp)) }
    Chef::Log.warn('No properties are set, skipping load_current_value. Should this resource exist?')
    return
  end

  current_config = load_config_file_section(new_resource.config_file)
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
    config_file_type: :json,
    config_base_path: 'isc_kea_config_',
    # config_path_override: %w(Dhcp4),
    property_name_gsub: %w(_ -),
  }.freeze
end

action_class do
  include ChefAutoAccumulator::Resource
end

action :create do
  converge_if_changed do
    resource_properties.each do |rp|
      next if nil_or_empty?(new_resource.send(rp))

      accumulator_config(:set, rp, new_resource.send(rp))
    end

    new_resource.extra_options.each { |key, value| accumulator_config(:set, key, value) } if property_is_set?(:extra_options)
  end
end

action :delete do
  set_properties = resource_properties.push(:extra_options).filter { |rp| property_is_set?(rp) }
  delete_properties = nil_or_empty?(set_properties) ? resource_properties : set_properties
  diff_properties = delete_properties.filter { |dp| load_config_file_section(new_resource.config_file).key?(translate_property_value(dp)) }
  diff_properties.map! { |dp| translate_property_value(dp) }

  if property_is_set?(:extra_options)
    extra_options_diff = new_resource.extra_options.keys.filter { |eo| load_config_file_section(new_resource.config_file).key?(eo) }
    diff_properties.concat(extra_options_diff) unless nil_or_empty?(extra_options_diff)
  end

  converge_by("Deleting configuration for #{diff_properties.join(', ')}") do
    diff_properties.each { |rp| accumulator_config(:delete, rp) }
  end unless diff_properties.empty?
end
