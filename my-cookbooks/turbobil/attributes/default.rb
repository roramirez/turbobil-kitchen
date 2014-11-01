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
default['turbobil']['ruby'] = "2.1.2p95" #(2014-05-08 revision 45877)
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
end
default['postgresql']['username']['postgres'] = "postgres"
default['postgresql']['password']['postgres'] = "psqlpass"
default['postgresql']['server_host'] = "localhost"
default['postgresql']['config']['port'] = 5432


# database
default['turbobil']['database_adapter'] = "postgresql"
default['turbobil']['database_password'] = "password"
default['turbobil']['database_user'] = default['turbobil']['user']

default['turbobil']['environments'] = %w{production}
