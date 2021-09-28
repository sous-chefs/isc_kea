#
# Cookbook:: isc_kea_test
# Recipe:: config_dhcp6
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

isc_kea_config_dhcp6 'test' do
  preferred_lifetime 3000
  valid_lifetime 4000
  renew_timer 1000
  rebind_timer 2000
end

isc_kea_config_dhcp6_interfaces 'dhcp6_interfaces' do
  interfaces 'eth0'
end

isc_kea_config_dhcp6_lease_database 'lease_database' do
  type 'memfile'
  lfc_interval 3600
end

isc_kea_config_dhcp6_subnet '2001:db8:1::/64' do
  interface 'eth0'
  pools [
    { 'pool' => '2001:db8:1::/80' },
  ]
end

isc_kea_config_dhcp6_loggers 'kea-dhcp6' do
  debuglevel 0
  severity :info
end

isc_kea_config_dhcp6_loggers_output 'logger_stdout' do
  logger_name 'kea-dhcp6'
  output 'stdout'
end
