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

use 'partial/_config_auto_accumulator'
use 'partial/_config_parameters_common'

def auto_accumulator_options_override
  { config_path_override: %w(Dhcp6) }.freeze
end

property :cache_threshold, Integer

property :cache_max_age, Integer

property :calculate_tee_times, [true, false]

property :data_directory, String

property :ddns_generated_prefix, String

property :ddns_override_client_update, [true, false]

property :ddns_override_no_update, [true, false]

property :ddns_replace_client_name, [String, Symbol],
          equal_to: %w(never always when-present when-not-present),
          coerce: proc { |p| p.to_s }

property :ddns_qualifying_suffix, String

property :ddns_send_updates, [true, false]

property :ddns_update_on_renew, [true, false]

property :ddns_use_conflict_resolution, [true, false]

property :decline_probation_period, Integer

property :dhcp4o6_port, Integer

property :host_reservation_identifiers, Array

property :hostname_char_replacement, String

property :hostname_char_set, String

property :ip_reservations_unique, [true, false]

property :mac_sources, [String, Array],
          coerce: proc { |p| p.is_a?(String) ? p.split(',') : p }

property :min_preferred_lifetime, Integer

property :min_valid_lifetime, Integer

property :max_preferred_lifetime, Integer

property :max_valid_lifetime, Integer

property :parked_packet_limit, Integer

property :preferred_lifetime, Integer

property :rapid_commit, String

property :rebind_timer, Integer

property :relay_supplied_options, [String, Array],
          coerce: proc { |p| p.is_a?(String) ? p.split(',') : p }

property :renew_timer, Integer

property :reservations_global, [true, false]

property :reservations_in_subnet, [true, false]

property :reservations_out_of_pool, [true, false]

property :server_tag, String

property :statistic_default_sample_count, Integer

property :statistic_default_sample_age, Integer

property :store_extended_info, [true, false]

property :t1_percent, [Integer, Float]

property :t2_percent, [Integer, Float]

property :valid_lifetime, Integer
