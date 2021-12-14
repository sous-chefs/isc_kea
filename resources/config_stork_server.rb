#
# Cookbook:: isc_kea
# Resource:: config_stork_server
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
      stork_database_host: 'STORK_DATABASE_HOST',
      stork_database_port: 'STORK_DATABASE_PORT',
      stork_database_name: 'STORK_DATABASE_NAME',
      stork_database_user_name: 'STORK_DATABASE_USER_NAME',
      stork_database_password: 'STORK_DATABASE_PASSWORD',
      stork_rest_host: 'STORK_REST_HOST',
      stork_rest_port: 'STORK_REST_PORT',
      stork_rest_tls_certificate: 'STORK_REST_TLS_CERTIFICATE',
      stork_rest_tls_private_key: 'STORK_REST_TLS_PRIVATE_KEY',
      stork_rest_tls_ca_certificate: 'STORK_REST_TLS_CA_CERTIFICATE',
      stork_rest_static_files_dir: 'STORK_REST_STATIC_FILES_DIR',
      stork_server_enable_metrics: 'STORK_SERVER_ENABLE_METRICS',
    },
  }.freeze
end

property :stork_database_host, String

property :stork_database_port, Integer

property :stork_database_name, String

property :stork_database_user_name, String

property :stork_database_password, String

property :stork_rest_host, String

property :stork_rest_port, Integer

property :stork_rest_tls_certificate, String

property :stork_rest_tls_private_key, String

property :stork_rest_tls_ca_certificate, String

property :stork_rest_static_files_dir, String

property :stork_server_enable_metrics, [true, false]
