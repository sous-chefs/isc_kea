#
# Cookbook:: isc_kea
# Resource:: config_stork_agent
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

use 'partial/_config_auto_accumulator_stork'

def auto_accumulator_options_override
  {
    config_path_override: %w(global),
    property_translation_matrix: {
      stork_agent_address: 'STORK_AGENT_ADDRESS',
      stork_agent_port: 'STORK_AGENT_PORT',
      stork_agent_listen_stork_only: 'STORK_AGENT_LISTEN_STORK_ONLY',
      stork_agent_listen_prometheus_only: 'STORK_AGENT_LISTEN_PROMETHEUS_ONLY',
      stork_agent_skip_tls_cert_verification: 'STORK_AGENT_SKIP_TLS_CERT_VERIFICATION',
      stork_agent_prometheus_kea_exporter_address: 'STORK_AGENT_PROMETHEUS_KEA_EXPORTER_ADDRESS',
      stork_agent_prometheus_kea_exporter_port: 'STORK_AGENT_PROMETHEUS_KEA_EXPORTER_PORT',
      stork_agent_prometheus_kea_exporter_interval: 'STORK_AGENT_PROMETHEUS_KEA_EXPORTER_INTERVAL',
      stork_agent_prometheus_bind9_exporter_address: 'STORK_AGENT_PROMETHEUS_BIND9_EXPORTER_ADDRESS',
      stork_agent_prometheus_bind9_exporter_port: 'STORK_AGENT_PROMETHEUS_BIND9_EXPORTER_PORT',
      stork_agent_prometheus_bind9_exporter_interval: 'STORK_AGENT_PROMETHEUS_BIND9_EXPORTER_INTERVAL',
    },
  }.freeze
end

property :stork_agent_address, String

property :stork_agent_port, Integer

property :stork_agent_listen_stork_only, [true, false]

property :stork_agent_listen_prometheus_only, [true, false]

property :stork_agent_skip_tls_cert_verification, [true, false]

property :stork_agent_prometheus_kea_exporter_address, String

property :stork_agent_prometheus_kea_exporter_port, Integer

property :stork_agent_prometheus_kea_exporter_interval, Integer

property :stork_agent_prometheus_bind9_exporter_address, String

property :stork_agent_prometheus_bind9_exporter_port, String

property :stork_agent_prometheus_bind9_exporter_interval, Integer
