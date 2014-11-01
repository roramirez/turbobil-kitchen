name 'turbobil'
maintainer 'Rodrigo Ramirez Norambuena'
maintainer_email 'rodrigo@blackhole.cl'
license 'Apache 2.0'
description 'Installs and configures TurboBil'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.0.1'
recipe 'turbobil', 'Main configuration'

depends 'apt'
depends 'ruby_build'
depends 'user'
depends 'application_ruby'
depends 'postgresql'
depends 'database'
depends 'simple_iptables'


supports 'debian'
supports 'ubuntu'
