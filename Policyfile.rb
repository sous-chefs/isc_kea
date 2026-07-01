# frozen_string_literal: true

name 'isc_kea'

run_list 'isc_kea_test'

cookbook 'isc_kea', path: '.'
cookbook 'chef_auto_accumulator', git: 'https://github.com/sous-chefs/chef_auto_accumulator.git', branch: 'main'
cookbook 'yum-epel', git: 'https://github.com/sous-chefs/yum-epel.git', branch: 'main'
cookbook 'isc_kea_test', path: './test/cookbooks/isc_kea_test'

Dir.children('./test/cookbooks/isc_kea_test/recipes').grep(/\.rb\z/).sort.each do |recipe|
  recipe_name = File.basename(recipe, '.rb')

  named_run_list recipe_name.to_sym, 'isc_kea_test::' + recipe_name
end
