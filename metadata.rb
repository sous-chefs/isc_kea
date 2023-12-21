name 'isc_kea'
maintainer 'Sous Chefs'
maintainer_email 'help@sous-chefs.org'
license 'Apache-2.0'
description 'Installs/Configures isc_kea'
source_url 'https://github.com/sous-chefs/isc_kea'
issues_url 'https://github.com/sous-chefs/isc_kea/issues'
chef_version '>= 16.0'
version '1.4.1'

supports 'amazon'
supports 'centos'
supports 'debian'
supports 'fedora'
supports 'oracle'
supports 'redhat'
supports 'scientific'
supports 'ubuntu'

depends 'chef_auto_accumulator', '~> 0.4'
depends 'yum-epel', '~> 4.1'
