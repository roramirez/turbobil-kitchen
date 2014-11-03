#
# Cookbook Name:: turbobil
# Recipe:: database_mysql
#

mysql = node['mysql']
turbobil = node['turbobil']

include_recipe "mysql::server"
include_recipe "database::mysql"

mysql_connection = {
  :host => mysql['server_host'],
  :username => mysql['server_root_username'],
  :password => mysql['server_root_password'],
  :socket => mysql['server']['socket']
}

# install packages
mysql['packages'].each do |pkg|
  package pkg
end

# user for turbobil
mysql_database_user turbobil['database_user'] do
  connection mysql_connection
  password turbobil['database_password']
  host mysql['client_host']
  action :create
end

# create database and privileges
turbobil['environments'].each do |environment|
  mysql_database "turbobil_database" do
    database_name "turbobil_#{environment}"
    encoding "utf8"
    collation "utf8_unicode_ci"
    connection mysql_connection
    action :create
  end

  mysql_database_user turbobil['database_user'] do
    connection mysql_connection
    password turbobil['database_password']
    database_name "turbobil_#{environment}"
    host mysql['client_host']
    privileges ["SELECT", "UPDATE", "INSERT", "DELETE", "CREATE", "DROP", "INDEX", "ALTER", "LOCK TABLES"]
    action :grant
  end
end

node.default['turbobil']['database_host'] = mysql['client_host']
