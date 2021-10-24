#
# Cookbook:: isc_kea
# Resource:: service_stork
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

property :service_name, String,
          equal_to: %w(isc-stork-agent isc-stork-server),
          name_property: true

action_class do
  def do_service_action(resource_action)
    with_run_context(:root) do
      declare_resource(:service, new_resource.service_name) { delayed_action(resource_action) }
    end
  end
end

%i(start stop restart reload enable disable).each do |action_type|
  send(:action, action_type) { do_service_action(action) }
end
