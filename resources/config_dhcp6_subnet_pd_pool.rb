#
# Cookbook:: isc_kea
# Resource:: config_dhcp6_subnet_pool
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
use 'partial/_config_dhcp6_parameters_pool'

def auto_accumulator_options_override
  {
    config_properties_skip: %i(subnet),
    config_path_override: %w(Dhcp6 subnet6),
    config_path_type: :array_contained,
    config_path_sort_keys: %w(prefix),
    config_path_match_key: 'subnet',
    config_path_match_value: subnet,
    config_path_contained_key: 'pd-pools',
    config_match: {
      'prefix' => prefix,
    },
  }.freeze
end

property :subnet, String,
          required: true,
          desired_state: false

property :prefix, String,
          name_property: true

property :prefix_len, Integer

property :client_class, String

property :delegated_len, Integer

property :excluded_prefix, String

property :excluded_prefix_len, Integer

property :option_data, Array

property :require_client_classes, Array
