#
# Cookbook:: isc_kea
# Resource:: _config_dhcp6_parameters_subnet
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

property :cache_threshold, [Integer, Float]

property :cache_max_age, [Integer, Float]

property :client_class, String

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

property :hostname_char_replacement, String

property :hostname_char_set, String

property :interface, String

property :interface_id, String

property :min_preferred_lifetime, Integer

property :min_valid_lifetime, Integer

property :max_preferred_lifetime, Integer

property :max_valid_lifetime, Integer

property :preferred_lifetime, Integer

property :rapid_commit, [true, false]

property :rebind_timer, Integer

property :relay, Hash

property :renew_timer, Integer

property :require_client_classes, Array

property :reservations_global, [true, false]

property :reservations_in_subnet, [true, false]

property :reservations_out_of_pool, [true, false]

property :store_extended_info, [true, false]

property :t1_percent, [Integer, Float]

property :t2_percent, [Integer, Float]

property :valid_lifetime, Integer
