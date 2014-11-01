#
# Cookbook Name:: turbobil
# Recipe:: git
#

turbobil = node['turbobil']

include_recipe "git"

# clone turbobil repository from github
repo_path = "/home/#{turbobil['user']}/turbobil"
git repo_path  do
  reference turbobil['branch']
  repository turbobil['repository']
  enable_submodules true
  action :checkout
  user turbobil['user']
  group turbobil['user']
end

