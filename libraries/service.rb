#
# Cookbook:: isc_kea
# Library:: service
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

module IscKea
  module Cookbook
    module ServiceHelpers
      def kea_run_as_user
        'root'
      end

      def kea_config_test_command(service_name, config_file)
        binary_path = case service_name
                      when 'kea-dhcp4', 'isc-kea-dhcp4-server'
                        '/usr/sbin/kea-dhcp4'
                      when 'kea-dhcp6', 'isc-kea-dhcp6-server'
                        '/usr/sbin/kea-dhcp6'
                      when 'kea-dhcp-ddns', 'isc-kea-dhcp-ddns-server'
                        '/usr/sbin/kea-dhcp-ddns'
                      when 'kea-ctrl-agent', 'isc-kea-ctrl-agent'
                        '/usr/sbin/kea-ctrl-agent'
                      else
                        raise ArgumentError, "Unsupported service name #{service_name}"
                      end

        Chef::Log.debug("kea_config_test_command: #{binary_path} -t #{config_file}")

        "#{binary_path} -t #{config_file}"
      end
    end
  end
end
