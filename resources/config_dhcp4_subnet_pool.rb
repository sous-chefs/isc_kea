#
# Cookbook:: isc_kea
# Resource:: config_dhcp4_subnet_pool
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
use 'partial/_config_dhcp4_parameters_pool'

def auto_accumulator_options_override
  {
    config_properties_skip: %i(subnet),
    config_path_override: %w(Dhcp4 subnet4),
    config_path_type: :array_contained,
    config_path_sort_keys: %w(pool),
    config_path_match_key: 'subnet',
    config_path_match_value: subnet,
    config_path_contained_key: 'pools',
    config_match: {
      'pool' => pool,
    },
  }.freeze
end

property :subnet, String,
          required: true,
          desired_state: false

property :pool, String,
          name_property: true
