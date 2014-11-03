# user
default['turbobil']['user'] = "turbobil"

# repository turbobil
default['turbobil']['repository'] = "https://github.com/roramirez/turbobil.git"
default['turbobil']['repo_path'] = "/home/#{default['turbobil']['user']}/turbobil"
default['turbobil']['branch'] = "rails-submodule"

# turbobil-rails
#default['turbobil']['repo_turbobil_rails'] =  "https://github.com/roramirez/turbobil-rails.git"
default['turbobil']['repo_turbobil_rails'] =  "#{default['turbobil']['repo_path']}/rails"
default['turbobil']['revision_turbobil-rails'] = "0.3.0-pre1"


# ruby
default['turbobil']['ruby'] = "2.1.2"
default['turbobil']['compile_ruby'] = true
default['turbobil']['bundler'] = "1.6.3"


# packages
if platform?("ubuntu", "debian")
  packages = %w{
    build-essential git curl wget python
  }
end
default['turbobil']['packages'] = packages


# PostgreSQL attributes
include_attribute 'postgresql'

default['postgresql']['version'] = "9.3"
if platform?("ubuntu", "debian")
  default['postgresql']['packages'] = %w{libpq-dev}
  default['mysql']['packages'] = %w{libmysqlclient-dev python-mysqldb}
end
default['postgresql']['username']['postgres'] = "postgres"
default['postgresql']['password']['postgres'] = "psqlpass"
default['postgresql']['server_host'] = "localhost"
default['postgresql']['config']['port'] = 5432

# MySQL attributes
default['mysql']['server_host'] = "localhost"
default['mysql']['client_host'] = "localhost"
default['mysql']['server_root_username'] = "root"
default['mysql']['server_root_password'] = "rootpass"
default['mysql']['server_repl_password'] = "replpass"
default['mysql']['server_debian_password'] = "debianpass"
default['mysql']['server']['socket'] = "/var/run/mysqld/mysqld.sock"

# database
default['turbobil']['database_adapter'] = "postgresql"
default['turbobil']['database_password'] = "password"
default['turbobil']['database_user'] = default['turbobil']['user']

default['turbobil']['environments'] = %w{production}
