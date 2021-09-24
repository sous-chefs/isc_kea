#
# Cookbook:: isc_kea
# Resource:: config_dhcp6
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

use 'partial/_config_file'

def auto_accumulator_options_override
  { config_path_override: %w(Dhcp6) }.freeze
end

property :cache_max_age, String

property :cache_threshold, String

property :calculate_tee_times, String

property :client_class, String

property :ddns_send_update, String

property :ddns_override_no_update, String

property :ddns_override_client_update, String

property :ddns_replace_client_name, String

property :ddns_generated_prefix, String

property :ddns_qualifying_suffix, String

property :decline_probation_period, String

property :delegated_len, String

property :dhcp4o6_port, String

property :excluded_prefix, String

property :excluded_prefix_len, String

property :hostname_char_set, String

property :hostname_char_replacement, String

property :interface, String

property :interface_id, String

property :max_preferred_lifetime, String

property :max_valid_lifetime, String

property :min_preferred_lifetime, String

property :min_valid_lifetime, String

property :option_data, String

property :option_def, String

property :preferred_lifetime, String

property :prefix, String

property :prefix_len, String

property :rapid_commit, String

property :rebind_timer, String

property :relay, String

property :renew_timer, String

property :require_client_classes, String

property :reservation_mode, String

property :reservations_global, String

property :reservations_in_subnet, String

property :reservations_out_of_pool, String

property :t1_percent, String

property :t2_percent, String

property :valid_lifetime, String
