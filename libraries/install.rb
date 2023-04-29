#
# Cookbook:: isc_kea
# Library:: install
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
    module InstallHelpers
      def default_repo_support_packages
        packages = case node['platform_family']
                   when 'amazon', 'fedora', 'rhel'
                     %w(yum-utils)
                   when 'debian'
                     %w(apt-transport-https)
                   end

        packages.push('debian-keyring', 'debian-archive-keyring') if platform?('debian')

        packages
      end

      def default_kea_debian_key_url
        case install_version
        when '1-6'
          'https://dl.cloudsmith.io/public/isc/kea-1-6/gpg.0607E2621F1564A6.key'
        when '1-7'
          'https://dl.cloudsmith.io/public/isc/kea-1-7/gpg.40544590508A17DE.key'
        when '1-8'
          'https://dl.cloudsmith.io/public/isc/kea-1-8/gpg.4DD5AE28ADA7268E.key'
        when '1-9'
          'https://dl.cloudsmith.io/public/isc/kea-1-9/gpg.5DC67B0A74E30739.key'
        when '2-0'
          'https://dl.cloudsmith.io/public/isc/kea-2-0/gpg.8029D4AFA58CBB5E.key'
        when '2-1'
          'https://dl.cloudsmith.io/public/isc/kea-2-1/gpg.32D53EC4807EC10E.key'
        when '2-2'
          'https://dl.cloudsmith.io/public/isc/kea-2-2/gpg.A8CB727C62565FF8.key'
        when '2-3'
          'https://dl.cloudsmith.io/public/isc/kea-2-3/gpg.DA05D46B7BABA24A.key'
        else
          raise ArgumentError, "Unsupported version #{install_version}"
        end
      end

      def default_kea_install_packages
        case node['platform_family']
        when 'amazon', 'fedora', 'rhel'
          %w(isc-kea isc-kea-devel isc-kea-hooks isc-kea-libs isc-kea-shell)
        when 'debian'
          %w(isc-kea-admin isc-kea-common isc-kea-ctrl-agent isc-kea-dev isc-kea-dhcp-ddns-server isc-kea-dhcp4-server isc-kea-dhcp6-server isc-kea-doc)
        else
          raise ArgumentError, "Unsupported platform family #{node['platform_family']}"
        end
      end

      def default_stork_install_packages
        %w(isc-stork-agent isc-stork-server)
      end

      def default_stork_debian_key_url
        'https://dl.cloudsmith.io/public/isc/stork/gpg.77F64EC28053D1FB.key'
      end
    end
  end
end
