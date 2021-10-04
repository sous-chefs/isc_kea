source 'https://supermarket.chef.io'

metadata

cookbook 'chef_auto_accumulator', git: 'https://github.com/sous-chefs/chef_auto_accumulator', branch: 'main'

group :integration do
  cookbook 'isc_kea_test', path: 'test/cookbooks/isc_kea_test'
end
