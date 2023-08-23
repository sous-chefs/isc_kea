#
# Cookbook:: isc_kea_test
# Recipe:: config_dhcp4
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

isc_kea_config_dhcp4 'test' do
  boot_file_name 'test.bootfile'
end

isc_kea_config_dhcp4_interfaces 'eth0' do
  interfaces 'eth0'
end

# isc_kea_config_dhcp4_option_def 'foo' do
#   code 222
#   type 'uint32'
#   array false
#   space 'dhcp4'
#   # action :delete
# end

# isc_kea_config_dhcp4_option_data 'foo' do
#   code 222
#   csv_format true
#   space 'dhcp4'
#   data '12345'
#   # action :delete
# end

# isc_kea_config_dhcp4_subnet '192.0.2.0/24' do
#   id 1
# end

# isc_kea_config_dhcp4_subnet_pool '192.0.2.10-192.0.2.20' do
#   subnet '192.0.2.0/24'
# end

# isc_kea_config_dhcp4_subnet_pool '192.0.2.64/26' do
#   subnet '192.0.2.0/24'
# end

# isc_kea_config_dhcp4_subnet '192.0.3.0/24' do
#   id 2
# end

# isc_kea_config_dhcp4_subnet_relay 'test' do
#   subnet '192.0.3.0/24'

#   ip_addresses '10.0.0.2'
#   # action :delete
# end

# isc_kea_config_dhcp4_subnet_pool '192.0.3.10-192.0.3.20' do
#   subnet '192.0.3.0/24'
# end

# isc_kea_config_dhcp4_subnet_pool '192.0.3.64/26' do
#   subnet '192.0.3.0/24'
# end

# isc_kea_config_dhcp4_subnet_host_reservation 'test_id_1' do
#   subnet '192.0.2.0/24'
#   hw_address '1a:1b:1c:1d:1e:1f'
#   ip_address '192.0.2.202'
# end

# isc_kea_config_dhcp4_subnet_host_reservation_option_data 'test_id_1_vivso-suboptions' do
#   subnet '192.0.2.0/24'
#   ip_address '192.0.2.202'
#   option_name 'vivso-suboptions'
#   data '4491'
# end

# isc_kea_config_dhcp4_shared_network 'shared_network_test' do
#   authoritative false
# end

# isc_kea_config_dhcp4_shared_network_subnet '192.0.4.0/24' do
#   shared_network_name 'shared_network_test'

#   id 30
#   authoritative false
# end

# isc_kea_config_dhcp4_shared_network_subnet_option_data 'routers' do
#   shared_network_name 'shared_network_test'
#   subnet '192.0.4.0/24'

#   code 3
#   always_send false
#   csv_format true
#   space 'dhcp4'
#   data '192.0.4.1'
# end

# isc_kea_config_dhcp4_shared_network_subnet_pool '192.0.4.10 - 192.0.4.50' do
#   shared_network_name 'shared_network_test'
#   subnet '192.0.4.0/24'
# end

# isc_kea_config_dhcp4_shared_network_subnet_pool '192.0.4.64/26' do
#   shared_network_name 'shared_network_test'
#   subnet '192.0.4.0/24'
# end

# isc_kea_config_dhcp4_subnet_host_reservation 'test_id_2' do
#   subnet '192.0.3.0/24'
#   hw_address '1a:1b:1c:1d:1e:97'
#   ip_address '192.0.3.202'
#   hostname 'test-host-01'
#   # action :delete
# end

# isc_kea_config_dhcp4_global_host_reservation 'test_id_2' do
#   hw_address '1a:1b:1c:1d:1e:98'
#   ip_address '192.0.3.210'
#   hostname 'test-host-02'
# end

# isc_kea_config_dhcp4_loggers 'kea-dhcp4' do
#   debuglevel 0
#   severity :info
# end

# isc_kea_config_dhcp4_loggers_output 'stdout' do
#   logger_name 'kea-dhcp4'
#   flush true
#   maxsize 204800
#   maxver 4
#   pattern '%d{%y.%m.%d %H:%M:%S.%q} %-5p [%c/%i] %m\n'
# end
