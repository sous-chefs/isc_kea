#
# Cookbook:: isc_kea
# Resource:: config_dhcp4_client_class
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

unified_mode true

use 'partial/_config_auto_accumulator'
use 'partial/_config_parameters_common'

def auto_accumulator_options_override
  {
    config_path_override: %w(Dhcp4 client-classes),
    config_path_type: :array,
    config_path_match_key: 'name',
    config_path_match_value: class_name,
    property_translation_matrix: {
      option_name: 'name',
    },
  }.freeze
end

property :class_name, String,
          name_property: true

property :test, String

property :option_def, [Array, Hash],
          coerce: proc { |p| p.is_a?(Array) ? p : [p] }

property :option_data, [Array, Hash],
          coerce: proc { |p| p.is_a?(Array) ? p : [p] }

property :valid_lifetime, Integer

property :min_valid_lifetime, Integer

property :max_valid_lifetime, Integer

property :only_if_required, [true, false]

property :boot_file_name, String

property :next_server, String

property :server_hostname, String
