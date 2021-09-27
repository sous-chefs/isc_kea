#
# Cookbook:: isc_kea
# Resource:: service
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

include IscKea::Cookbook::Helpers

unified_mode true

property :service_name, String,
          equal_to: %w(kea-ctrl-agent isc-kea-ctrl-agent kea-dhcp-ddns isc-kea-dhcp-ddns-server kea-dhcp4 isc-kea-dhcp4-server kea-dhcp6 isc-kea-dhcp6-server),
          name_property: true

property :config_file, String,
          default: lazy { default_config_file }

property :config_test, [true, false],
          default: true,
          description: 'Perform configuration file test before performing service action'

property :config_test_fail_action, Symbol,
          equal_to: %i(raise log),
          default: :raise,
          description: 'Action to perform upon configuration test failure.'

action_class do
  include IscKea::Cookbook::ServiceHelpers

  def do_service_action(resource_action)
    with_run_context(:root) do
      if %i(start restart reload).include?(resource_action)
        declare_resource(:ruby_block, "Run #{new_resource.service_name} pre #{resource_action} configuration test") do
          block do
            begin
              if new_resource.config_test
                cmd = Mixlib::ShellOut.new(kea_config_test_command(new_resource.service_name, new_resource.config_file))
                cmd.user = kea_run_as_user
                cmd.run_command.error!
                Chef::Log.info("Configuration test passed, creating #{new_resource.service_name} #{new_resource.declared_type} resource with action #{resource_action}")
              else
                Chef::Log.info("Configuration test disabled, creating #{new_resource.service_name} #{new_resource.declared_type} resource with action #{resource_action}")
              end

              declare_resource(:service, new_resource.service_name) { delayed_action(resource_action) }
            rescue Mixlib::ShellOut::ShellCommandFailed
              if new_resource.config_test_fail_action.eql?(:log)
                Chef::Log.error("Configuration test failed, #{new_resource.service_name} #{resource_action} action aborted!\n\n"\
                                "Error\n-----\n#{cmd.stderr}")
              else
                raise "Configuration test failed, #{new_resource.service_name} #{resource_action} action aborted!\n\n"\
                      "Error\n-----\nAction: #{resource_action}\n#{cmd.stderr}"
              end
            end
          end

          only_if { ::File.exist?(new_resource.config_file) }

          action :nothing
          delayed_action :run
        end
      else
        declare_resource(:service, new_resource.service_name) { delayed_action(resource_action) }
      end
    end
  end
end

%i(start stop restart reload enable disable).each do |action_type|
  send(:action, action_type) { do_service_action(action) }
end
