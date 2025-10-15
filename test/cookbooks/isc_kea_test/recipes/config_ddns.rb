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

isc_kea_config_dhcp_ddns 'ddns' do
  ip_address '127.0.0.1'
  port 53001
  dns_server_timeout 100
  ncr_protocol 'udp'
  ncr_format :json
end

isc_kea_config_dhcp_ddns_control_socket 'ddns' do
  socket_name '/var/run/kea/kea-ddns-ctrl-socket'
  socket_type 'unix'
end

isc_kea_config_dhcp_ddns_forward_ddns_domain 'example.com.' do
  key_name 'd2.md5.key'
  dns_servers({
                'ip-address' => '2001:db8:1::10',
                'port' => 7802,
                'key-name' => 'd2.sha1.key',
              })
end

isc_kea_config_dhcp_ddns_reverse_ddns_domain '2.0.192.in-addr.arpa.' do
  key_name 'd2.sha1.key'
  dns_servers({
                'ip-address' => '172.16.1.1',
                'port' => 5301,
                'key-name' => 'd2.md5.key',
              })
end

isc_kea_config_dhcp_ddns_tsig_key 'd2.md5.key' do
  algorithm 'HMAC-MD5'
  digest_bits 0
  secret 'LSWXnfkKZjdPJI5QxlpnfQ=='
end

isc_kea_config_dhcp_ddns_tsig_key 'd2.sha1.key' do
  algorithm 'HMAC-SHA1'
  digest_bits 0
  secret 'ACHZvN+gvMCnREbN/bgNeAj2rmM='
end

isc_kea_config_dhcp_ddns_loggers 'kea-dhcp-ddns' do
  debuglevel 99
  severity :info
end

isc_kea_config_dhcp_ddns_loggers_output 'stdout' do
  logger_name 'kea-dhcp-ddns'
  flush true
  maxsize 10240000
  maxver 1
  pattern '%D{%Y-%m-%d %H:%M:%S.%q} %-5p [%c/%i] %m\n'
end
