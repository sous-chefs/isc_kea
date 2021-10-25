#
# Cookbook:: isc_kea
# Resource:: config_dhcp4_option_data
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

use 'partial/_config_auto_accumulator_kea'
use 'partial/_config_parameters_common'

def auto_accumulator_options_override
  {
    config_path_override: %w(Dhcp4 option-data),
    config_path_type: :array,
    config_match: {
      'name' => option_name,
    },
    property_translation_matrix: {
      option_name: 'name',
    },
  }.freeze
end

property :option_name, String,
          name_property: true

property :code, Integer

property :space, String

property :csv_format, [true, false]

property :data, [String, Integer]

property :always_send, [true, false]
