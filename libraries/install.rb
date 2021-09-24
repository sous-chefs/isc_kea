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

      def default_install_packages
        %w(isc-kea isc-kea-devel isc-kea-hooks isc-kea-libs isc-kea-shell)
      end
    end
  end
end
