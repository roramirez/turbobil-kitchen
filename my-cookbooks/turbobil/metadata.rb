name              'turbobil'
maintainer        'Rodrigo Ramirez Norambuena'
maintainer_email  'rodrigo@blackhole.cl'
license           'Apache 2.0'
description       'Installs and configures TurboBil'
version           '0.0.1'

long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))

recipe 'turbobil','Main configuration'
depends 'apt'
depends 'ruby_build'
depends 'user'
depends 'application_ruby'
depends 'postgresql'
depends 'database'
depends 'simple_iptables'
depends 'asterisk'


supports 'debian'
supports 'ubuntu'
