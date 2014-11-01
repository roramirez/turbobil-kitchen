#
# Cookbook Name:: turbobil
# Recipe:: database_postgresql
#

postgresql = node['postgresql']
turbobil = node['turbobil']

include_recipe "postgresql::server"
include_recipe "database::postgresql"
include_recipe "postgresql::ruby"

postgresql_connection = {
  :host => postgresql['server_host'],
  :username => postgresql['username']['postgres'],
  :password => postgresql['password']['postgres']
}

# user for turbobil db
postgresql_database_user turbobil['database_user'] do
  connection postgresql_connection
  password turbobil['database_password']
  action :create
end

# install packages
postgresql['packages'].each do |pkg|
  package pkg
end

# create database turbobil and privileges
turbobil['environments'].each do |environment|
  postgresql_database "turbobil_database" do
    database_name "turbobil_#{environment}"
    template "template0"
    encoding "utf8"
    collation "en_US.UTF-8"
    connection postgresql_connection
    action :create
  end

  postgresql_database_user turbobil['database_user'] do
    connection postgresql_connection
    database_name "turbobil_#{environment}"
    password turbobil['database_password']
    action :grant
  end
end

node.default['turbobil']['database_host'] = postgresql['server_host']
node.default['turbobil']['database_port'] = postgresql['config']['port']
