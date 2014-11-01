#
# Cookbook Name:: turbobil
# Recipe:: packages
#

turbobil = node['turbobil']

# packages / dependencies
include_recipe "apt" if platform?("ubuntu", "debian")

# install the required packages.
turbobil['packages'].each do |pkg|
  package pkg
end

# upgrade the openssl
package "openssl" do
  action :upgrade
end
