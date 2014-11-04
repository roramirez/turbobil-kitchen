#
# Cookbook Name:: turbobil
# Recipe:: setup
#

turbobil = node['turbobil']

# Packages
include_recipe "turbobil::packages"

# Compile ruby
include_recipe "turbobil::ruby" if turbobil['compile_ruby']

# Turbobil User
include_recipe "turbobil::user"

# Turbobil Git
include_recipe "turbobil::git"

# Setup database
include_recipe "turbobil::database_#{turbobil['database_adapter']}"

# Deploy
include_recipe "turbobil::deploy"

# Asterisk
include_recipe "turbobil::asterisk"
