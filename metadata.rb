name 'isc_kea'
maintainer 'Ben Hughes'
maintainer_email 'bmhughes@bmhughes.co.uk'
license 'Apache-2.0'
description 'Installs/Configures isc_kea'
source_url 'https://github.com/bmhughes/isc_kea'
issues_url 'https://github.com/bmhughes/isc_kea/issues'
chef_version '>= 16.0'
version '0.2.0'

supports 'amazon'
supports 'centos'
supports 'debian'
supports 'fedora'
supports 'oracle'
supports 'redhat'
supports 'scientific'
supports 'ubuntu'

depends 'chef_auto_accumulator', '~> 0.2'
depends 'yum-epel', '~> 4.1'
