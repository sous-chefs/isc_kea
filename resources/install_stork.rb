#
# Cookbook:: isc_kea
# Resource:: install_stork
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

include IscKea::Cookbook::InstallHelpers

property :install_version, String,
          default: 'stork',
          equal_to: %w(stork stork-dev),
          description: 'Version of Stork to install'

property :repo_support_packages, Array,
          default: lazy { default_repo_support_packages }

property :packages, [String, Array],
          default: lazy { default_stork_install_packages },
          coerce: proc { |p| Array(p) },
          description: 'Override the default installation packages for the platform'

property :clear_default_config, [true, false],
          default: true,
          description: 'Clear default configuration on install'

property :apt_repo_key_url, String,
          default: lazy { default_stork_debian_key_url }

action_class do
  def do_package_action(action)
    package 'isc-stork' do
      package_name new_resource.packages
      action action
    end
  end
end

action :install do
  include_recipe 'yum-epel' if platform?('amazon', 'centos', 'redhat', 'scientific')

  package 'repo-supporting-packages' do
    package_name new_resource.repo_support_packages
    action action
  end

  case node['platform_family']
  when 'rhel', 'fedora'
    distro_name = platform?('fedora') ? 'fedora' : 'el'
    distro_version = node['platform_version'].to_i

    remote_file '/etc/yum.repos.d/isc-stork.repo' do
      source "https://dl.cloudsmith.io/public/isc/#{new_resource.install_version}/config.rpm.txt?distro=#{distro_name}&codename=#{distro_version}"

      owner 'root'
      group 'root'
      mode '0644'

      action :create
      notifies :run, 'notify_group[Post Stork yum repo install actions]', :immediately
    end

    notify_group 'Post Stork yum repo install actions' do
      notifies :run, 'execute[yum makecache -y]', :immediately
      notifies :makecache, 'yum_repository[isc-stork]', :immediately
      notifies :makecache, 'yum_repository[isc-stork-noarch]', :immediately
      notifies :makecache, 'yum_repository[isc-stork-source]', :immediately
    end

    execute 'yum makecache -y' do
      action :nothing
      only_if { distro_name.eql?('el') && distro_version.eql?(7) }
    end

    declare_resource(:yum_repository, 'isc-stork') { action :nothing }
    declare_resource(:yum_repository, 'isc-stork-noarch') { action :nothing }
    declare_resource(:yum_repository, 'isc-stork-source') { action :nothing }
  when 'debian'
    remote_file '/etc/apt/sources.list.d/isc-stork.list' do
      source "https://dl.cloudsmith.io/public/isc/#{new_resource.install_version}/config.deb.txt?distro=#{node['platform']}&codename=#{node['os_release']['version_codename']}"

      owner 'root'
      group 'root'
      mode '0644'

      action :create_if_missing
    end

    remote_file 'isc-stork-remote-apt-key' do
      source new_resource.apt_repo_key_url
      path "#{Chef::Config[:file_cache_path]}/isc-stork-repo.key"

      owner 'root'
      group 'root'
      mode '0644'

      action :create

      not_if { ::File.exist?('/usr/share/keyrings/isc-stork-archive-keyring.gpg') }

      notifies :run, 'execute[isc-stork-remote-apt-key-dearmor]', :immediately
      notifies :run, 'execute[apt-get-update]', :immediately
    end

    execute 'isc-stork-remote-apt-key-dearmor' do
      command "gpg -o /usr/share/keyrings/isc-stork-archive-keyring.gpg --dearmor #{Chef::Config[:file_cache_path]}/isc-stork-repo.key"
      action :nothing
    end

    execute 'apt-get-update' do
      command 'sudo apt-get update'
      action :nothing
    end
  else
    raise "Unsupported platform family #{node['platform_family']}"
  end

  do_package_action(action)
end

action :delete do
  case node['platform_family']
  when 'rhel', 'fedora'
    yum_repository 'isc-stork' do
      action :remove
    end
  when 'isc-stork'
    apt_repository 'name' do
      action :remove
    end
  else
    raise "Unsupported platform family #{node['platform_family']}"
  end
end

%i(upgrade remove).each do |install_action|
  action(install_action) { do_package_action(action) }
end
