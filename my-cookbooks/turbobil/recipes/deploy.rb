#
# Cookbook Name:: turbobil
# Recipe:: deploy
#

turbobil = node['turbobil']
postgresql = node['postgresql']

include_recipe "runit"

# deploy app rails provided by application cookbook
application 'app' do
  owner turbobil['user']
  group turbobil['user']
  path '/home/'  + turbobil['user']  + '/deploy/app'

  revision turbobil['revision_turbobil-rails']
  repository turbobil['repo_turbobil_rails']

  rails do
    database do
      username turbobil['database_user']
      password turbobil['database_password']
      host turbobil['database_host']
      port turbobil['database_port']
    end
    database_template "database.yml.#{turbobil['database_adapter']}.erb"

    bundler true

    case turbobil['database_adapter']
      when "postgresql"
        bundler_without_groups ["mysql"]
      when "mysql"
        bundler_without_groups ["postgresql"]
    end
  end

  migrate true
  migration_command "bundle exec rake assets:precompile"


  unicorn do
    worker_processes 2
    port "8080"
  end

#  passenger_apache2 do
#  end
end

include_recipe "turbobil::iptables"
