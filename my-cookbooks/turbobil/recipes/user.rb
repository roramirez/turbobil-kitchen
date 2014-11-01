#
# Cookbook Name:: turbobil
# Recipe:: user
#

turbobil = node['turbobil']

# we create new user that will run our application server
user_account turbobil['user'] do
  create_group true
  ssh_keygen false
end
