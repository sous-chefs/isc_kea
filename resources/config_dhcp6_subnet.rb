#
# Cookbook:: isc_kea
# Resource:: config_dhcp6_lease_database
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
use 'partial/_config_dhcp6_parameters_subnet'

def auto_accumulator_options_override
  {
    config_path_override: %w(Dhcp6 subnet6),
    config_path_type: :array,
    config_path_sort_keys: %w(id subnet),
    config_match: {
      'subnet' => subnet,
      'id' => id,
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

property :pd_pools, [Array, Hash],
          coerce: proc { |p| p.is_a?(Array) ? p.deep_sort : [p.deep_sort] }

property :client_class, String

property :require_client_classes, String
