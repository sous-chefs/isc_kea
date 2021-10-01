#
# Cookbook:: isc_kea_test
# Recipe:: service
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

dhcp4_service_name = platform_family?('debian') ? 'isc-kea-dhcp4-server' : 'kea-dhcp4'

isc_kea_service dhcp4_service_name do
  action %i(enable start)
  subscribes :restart, 'template[/etc/kea/kea-dhcp4.conf]', :delayed
end

dhcp6_service_name = platform_family?('debian') ? 'isc-kea-dhcp6-server' : 'kea-dhcp6'

isc_kea_service dhcp6_service_name do
  action %i(enable start)
  subscribes :restart, 'template[/etc/kea/kea-dhcp6.conf]', :delayed
end

dhcp_ddns_service_name = platform_family?('debian') ? 'isc-kea-dhcp-ddns-server' : 'kea-dhcp-ddns'

isc_kea_service dhcp_ddns_service_name do
  action %i(enable start)
  subscribes :restart, 'template[/etc/kea/kea-dhcp-ddns.conf]', :delayed
end

ctrl_agent_service_name = platform_family?('debian') ? 'isc-kea-ctrl-agent' : 'kea-ctrl-agent'

isc_kea_service ctrl_agent_service_name do
  action %i(enable start)
  subscribes :restart, 'template[/etc/kea/kea-ctrl-agent.conf]', :delayed
end
