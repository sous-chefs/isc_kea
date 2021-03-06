#
# Cookbook:: isc_kea
# Library:: helpers
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
    module Helpers
      def default_kea_config_file
        cfg_file = if resource_name.to_s.match?(/isc_kea_config_(dhcp4|dhcp6|dhcp_ddns|ctrl_agent)/)
                     "/etc/kea/kea-#{resource_name.to_s.match(/(dhcp4|dhcp6|dhcp_ddns|ctrl_agent)/)[1].gsub('_', '-')}.conf"
                   elsif resource_name.to_s.eql?('isc_kea_service')
                     "/etc/kea/kea-#{service_name.match(/(dhcp4|dhcp6|dhcp-ddns|ctrl-agent)/)[1]}.conf"
                   end

        Chef::Log.debug("default_config_file: Config file #{cfg_file}")

        cfg_file
      end

      def default_stork_config_file(declared_type)
        case declared_type
        when :isc_kea_config_stork_server
          '/etc/stork/server.env'
        when :isc_kea_config_stork_agent
          '/etc/stork/agent.env'
        else
          raise ArgumentError, "Unsupported resource type #{declared_type}"
        end
      end
    end
  end
end
