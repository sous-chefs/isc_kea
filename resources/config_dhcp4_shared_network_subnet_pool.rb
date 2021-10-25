#
# Cookbook:: isc_kea
# Resource:: config_dhcp4_shared_network_subnet_pool
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
    config_properties_skip: %i(subnet shared_network_name),
    config_path_override: %w(Dhcp4 shared-networks),
    config_path_type: :array_contained,
    config_path_match_key: %w(name subnet),
    config_path_match_value: [ shared_network_name, subnet ],
    config_path_contained_key: %w(subnet4 pools),
    config_match: {
      'pool' => pool,
    },
  }.freeze
end

property :shared_network_name, String,
          required: true,
          desired_state: false

property :subnet, String,
          required: true,
          desired_state: false

property :subnet, String,
          desired_state: false

property :pool, String,
          name_property: true
