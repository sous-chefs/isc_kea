#
# Cookbook:: isc_kea
# Resource:: config_dhcp4_subnet
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

use 'partial/_config_auto_accumulator_kea'
use 'partial/_config_parameters_common'
use 'partial/_config_dhcp4_parameters_subnet'

def auto_accumulator_options_override
  {
    config_path_override: %w(Dhcp4 subnet4),
    config_path_type: :array,
    config_path_sort_keys: %w(id subnet),
    config_match: {
      'subnet' => subnet,
      'id' => id,
    },
    property_translation_matrix: {
      subnet_4o6_interface: '4o6_interface',
      subnet_4o6_interface_id: '4o6_interface_id',
      subnet_4o6_subnet: '4o6_subnet',
    },
  }.freeze
end

property :id, Integer,
          required: true,
          identity: true,
          desired_state: true,
          callbacks: {
            'should be greater than 0 and less than 4294967295' => ->(p) { p > 0 && p < 4294967295 },
          }

property :subnet, String,
          name_property: true,
          desired_state: true
