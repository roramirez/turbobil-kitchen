#
# Cookbook Name:: turbobil
# Recipe:: ruby
#

turbobil = node['turbobil']

# Install ruby_build tool which we will use to build ruby
include_recipe 'ruby_build'

# Download and compile it:
ruby_build_ruby turbobil['ruby'] do
  prefix_path '/usr/local/'
  environment 'CFLAGS' => '-g -O2'
  action :install
end

# Install Bundler
gem_package 'bundler' do
  version turbobil['bundler']
  gem_binary '/usr/local/bin/gem'
  options '--no-ri --no-rdoc'
end


