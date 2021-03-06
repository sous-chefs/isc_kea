#
# Cookbook:: isc_kea
# Resource:: _config_dhcp6_reservation
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

property :hw_address, [String, nil],
          identity: true,
          desired_state: true,
          default: nil

property :duid, [String, nil],
          identity: true,
          desired_state: true,
          default: nil

property :flex_id, [String, nil],
          default: nil

property :ip_addresses, [Array, String],
          coerce: proc { |p| Array(p) },
          name_property: true,
          desired_state: true

property :prefixes, [Array, String],
          coerce: proc { |p| Array(p) }

property :hostname, String

property :client_classes, [String, Array],
          coerce: proc { |p| Array(p) }
