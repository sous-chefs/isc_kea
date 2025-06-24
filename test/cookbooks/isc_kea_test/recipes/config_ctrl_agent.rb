#
# Cookbook:: isc_kea_test
# Recipe:: config_ddns
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

isc_kea_config_ctrl_agent 'ctrl' do
  http_host '127.0.0.1'
  http_port 8000
end

isc_kea_config_ctrl_agent_authentication 'kea-ctrl-agent-auth' do
  type :basic
  realm 'kea-control-agent'
end

isc_kea_config_ctrl_agent_authentication_client 'admin' do
  password 'P@ssw0rd'
  comment 'admin is authorized'
end

isc_kea_config_ctrl_agent_control_socket 'dhcp4' do
  socket_name '/var/run/kea/kea4-ctrl-socket'
  socket_type 'unix'
  comment 'Socket to DHCP4 Server'
end

isc_kea_config_ctrl_agent_control_socket 'dhcp6' do
  comment 'Socket to DHCP6 Server'
  socket_type 'unix'
  socket_name '/var/run/kea/kea6-ctrl-socket'
end

isc_kea_config_ctrl_agent_control_socket 'd2' do
  socket_type 'unix'
  socket_name '/var/run/kea/kea-ddns-ctrl-socket'
  user_context({ 'in-use' => false })
end

isc_kea_config_ctrl_agent_loggers 'kea-ctrl-agent' do
  debuglevel 0
  severity :info
end

isc_kea_config_ctrl_agent_loggers_output 'stdout' do
  logger_name 'kea-ctrl-agent'
  flush true
  maxsize 204800
  maxver 4
  pattern '%d{%y.%m.%d %H:%M:%S.%q} %-5p [%c/%i] %m\n'
end
