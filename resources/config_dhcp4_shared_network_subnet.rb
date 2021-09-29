#
# Cookbook:: isc_kea
# Resource:: config_dhcp4_shared_network_subnet
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
use 'partial/_config_dhcp4_parameters_subnet'

def auto_accumulator_options_override
  {
    config_properties_skip: %i(shared_network_name),
    config_path_override: %w(Dhcp4 shared-networks),
    config_path_type: :array_contained,
    config_path_match_key: 'name',
    config_path_match_value: shared_network_name,
    config_path_contained_key: 'subnet4',
    config_match_key: 'subnet',
    config_match_value: subnet,
    property_translation_matrix: {
      subnet_4o6_interface: '4o6_interface',
      subnet_4o6_interface_id: '4o6_interface_id',
      subnet_4o6_subnet: '4o6_subnet',
    },
  }.freeze
end

property :shared_network_name, String,
          desired_state: false

property :id, Integer,
          callbacks: {
            'should be greater than 0 and less than 4294967295' => ->(p) { p > 0 && p < 4294967295 },
          }

property :subnet, String,
          name_property: true

property :pools, [Array, Hash],
          coerce: proc { |p| p.is_a?(Array) ? p : [p] }

property :option_data, [Array, Hash],
          coerce: proc { |p| p.is_a?(Array) ? p : [p] }