#
# Cookbook:: isc_kea
# Resource:: config_dhcp4
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

def auto_accumulator_options_override
  { config_path_override: %w(Dhcp4) }.freeze
end

property :allocator, String,
          equal_to: %w(iterative random flq)

property :authoritative, [true, false]

property :boot_file_name, String

property :cache_threshold, Integer

property :cache_max_age, Integer

property :calculate_tee_times, [true, false]

property :ddns_generated_prefix, String

property :ddns_override_client_update, [true, false]

property :ddns_override_no_update, [true, false]

property :ddns_replace_client_name, [String, Symbol],
          equal_to: %w(never always when-present when-not-present),
          coerce: proc { |p| p.to_s }

property :ddns_qualifying_suffix, String

property :ddns_send_updates, [true, false]

property :ddns_ttl_percent, [Float, Integer, String],
          coerce: proc { |p| p.to_f }

property :ddns_ttl, Integer

property :ddns_ttl_min, Integer

property :ddns_ttl_max, Integer

property :ddns_update_on_renew, [true, false]

property :ddns_use_conflict_resolution, [true, false]

property :ddns_conflict_resolution_mode, [String, Symbol],
          equal_to: %w(check-with-dhcid no-check-with-dhcid check-exists-with-dhcid no-check-without-dhcid),
          coerce: proc { |p| p.to_s }

property :decline_probation_period, Integer

property :dhcp4o6_port, Integer

property :echo_client_id, [true, false]

property :host_reservation_identifiers, Array

property :hostname_char_set, String

property :hostname_char_replacement, String

property :ip_reservations_unique, [true, false]

property :match_client_id, [true, false]

property :min_preferred_lifetime, Integer

property :min_valid_lifetime, Integer

property :max_preferred_lifetime, Integer

property :max_valid_lifetime, Integer

property :next_server, String

property :parked_packet_limit, Integer

property :rebind_timer, Integer

property :renew_timer, Integer

property :reservations_global, [true, false]

property :reservations_in_subnet, [true, false]

property :reservations_out_of_pool, [true, false]

property :server_hostname, String

property :server_tag, String

property :stash_agent_option, [true, false]

property :statistic_default_sample_count, Integer

property :statistic_default_sample_age, Integer

property :store_extended_info, [true, false]

property :t1_percent, [Integer, Float]

property :t2_percent, [Integer, Float]

property :valid_lifetime, Integer
