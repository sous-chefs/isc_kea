#
# Cookbook:: isc_kea
# Resource:: _config_dhcp6_parameters_pool
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

property :client_class, String,
          deprecated: 'The client_class option has been renamed to client_classes starting from Kea 2.7.5'

property :client_classes, [String, Array],
          coerce: proc { |p| Array(p) }

property :require_client_classes, Array,
          deprecated: 'The require_client_classes option has been renamed to evaluate_additional_classes starting from Kea 2.7.4'

property :evaluate_additional_classes, Array
