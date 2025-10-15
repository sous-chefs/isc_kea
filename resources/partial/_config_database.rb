#
# Cookbook:: isc_kea
# Resource:: _config_database
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

property :type, [String, Symbol],
          required: true,
          equal_to: %w(memfile mysql postgresql cdl),
          coerce: proc(&:to_s)

property :persist, [true, false]

property :database_name, String

property :host, String

property :port, Integer

property :user, String

property :password, String

property :contact_points, String

property :keyspace, String

property :connect_timeout, Integer

property :max_reconnect_tries, Integer

property :reconnect_wait_time, Integer

property :on_fail, String,
          equal_to: %w(stop-retry-exit serve-retry-exit serve-retry-continue)

property :lfc_interval, Integer

property :max_row_errors, Integer

property :request_timeout, Integer

property :tcp_keepalive, Integer

property :tcp_nodelay, [true, false]

property :consistency, String,
          equal_to: %w(any one two three quorum all local-quorum each-quorum serial local-serial local-one)

property :serial_consistency, String,
          equal_to: %w(any one two three quorum all local-quorum each-quorum serial local-serial local-one)

property :readonly, [true, false]

property :read_timeout, Integer

property :write_timeout, Integer

property :tcp_user_timeout, Integer
