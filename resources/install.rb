#
# Cookbook:: ics_kea
# Resource:: install
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

include IscKea::Cookbook::InstallHelpers

property :install_version, String,
          default: '1.9',
          coerce: proc { |p| p.gsub('.', '-') },
          description: 'Version of Kea to install'

property :repo_support_packages, Array,
          default: lazy { default_repo_support_packages }

property :packages, [String, Array],
          default: lazy { default_install_packages },
          coerce: proc { |p| p.is_a?(Array) ? p : [p] },
          description: 'Override the default installation packages for the platform'

property :clear_default_config, [true, false],
          default: true,
          description: 'Clear default configuration on install'

unified_mode true

action_class do
  include IscKea::Cookbook::InstallHelpers

  def do_package_action(action)
    package 'isc-kea' do
      package_name new_resource.packages
      action action
    end

    %w(ctrl-agent dhcp4 dhcp6 dhcp-ddns).each do |cfg_file|
      file "/etc/kea/kea-#{cfg_file}.conf" do
        content '{}'
        action(:nothing)
        subscribes :create, 'package[isc-kea]', :immediately
      end
    end if new_resource.clear_default_config
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

    remote_file "/etc/yum.repos.d/isc-kea-#{new_resource.install_version}.repo" do
      source "https://dl.cloudsmith.io/public/isc/kea-1-9/config.rpm.txt?distro=#{distro_name}&codename=#{distro_version}"

      owner 'root'
      group 'root'
      mode '0644'

      action :create
    end

    yum_repository "isc-kea-#{new_resource.install_version}" do
      action :nothing
      subscribes :makecache, "remote_file[/etc/yum.repos.d/isc-kea-#{new_resource.install_version}.repo]", :immediately
    end
  when 'debian'
    remote_file "/etc/apt/sources.list.d/isc-kea-#{new_resource.install_version}.list" do
      source "https://dl.cloudsmith.io/public/isc/kea-#{new_resource.install_version}/config.deb.txt?distro=#{node['platform']}&codename=#{node['os_release']['version_codename']}"

      owner 'root'
      group 'root'
      mode '0644'

      action :create
      notifies :run, 'notify_group[Post APT repo install actions]', :immediately
    end

    notify_group 'Post APT repo install actions' do
      notifies :create, 'remote_file[get-kea-remote-apt-key]', :immediately
      notifies :run, "execute[apt-key add #{Chef::Config[:file_cache_path]}/isc-kea-repo.key]", :immediately
      notifies :run, 'execute[sudo apt-get update]', :immediately
    end

    remote_file 'get-kea-remote-apt-key' do
      source debian_key_url
      path "#{Chef::Config[:file_cache_path]}/isc-kea-repo.key"

      owner 'root'
      group 'root'
      mode '0644'

      action :nothing
    end

    execute "apt-key add #{Chef::Config[:file_cache_path]}/isc-kea-repo.key" do
      action :nothing
    end

    execute 'sudo apt-get update' do
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
    yum_repository "isc-kea-#{new_resource.install_version}" do
      action :remove
    end
  when "isc-kea-#{new_resource.install_version}"
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
