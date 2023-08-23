#
# Cookbook:: isc_kea_test
# Recipe:: default
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

include_recipe '::net_setup'

include_recipe '::install'
# include_recipe '::install_stork'

include_recipe '::config_dhcp4'
# include_recipe '::config_dhcp6'
# include_recipe '::config_ddns'
# include_recipe '::config_ctrl_agent'
# include_recipe '::config_stork'

# include_recipe '::service'
