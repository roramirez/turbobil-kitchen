#
# Cookbook Name:: turbobil
# Recipe:: asterisk
#

asterisk = node['asterisk']
turbobil = node['turbobil']

if turbobil['asterisk']
  include_recipe "asterisk"
end

settings = %x(asterisk -rx 'core show settings')
st_directory_etc = "Configuration directory"
st_directory_agi = "AGI Scripts directory:"
etc_dir = nil
agi_dir = nil
settings.each_line do |line|
  # get directory etc asterisk
  if line.match(/#{st_directory_etc}/)
    split = line.split(':')
    if split.count == 2
      etc_dir = split[1].delete(' ').delete("\n")
    end
  end

  # get directory agi
  if line.match(/#{st_directory_agi}/)
    split = line.split(':')
    if split.count == 2
      agi_dir = split[1].delete(' ').delete("\n")
    end
  end

end

# copy exten to etc asterisk
exten_file_repo = "#{turbobil['repo_path']}/agi_ast/exten_tbill.conf"
if ::File.exist?(exten_file_repo)
  ruby_block "Copy Exten File Asterisk" do
   block do
    ::FileUtils.cp  exten_file_repo, "#{etc_dir}/exten_tbill.conf"
   end
   if ::File.exist?("#{etc_dir}/exten_tbill.conf")
     not_if { ::FileUtils.compare_file(exten_file_repo, "#{etc_dir}/exten_tbill.conf") }
   end
  end
end

# add link to agi
link "#{agi_dir}/tbil" do
  to "#{turbobil['repo_path']}/agi_ast"
end


template "#{turbobil['repo_path']}/agi_ast/config.ini" do
  source "config.ini.#{turbobil['database_adapter']}.erb"
  user turbobil['user']
  group turbobil['user']
  mode 0644

  variables(
    :username => turbobil['database_user'],
    :password => turbobil['database_password'],
    :host     => turbobil['database_host'],
    :port     => turbobil['database_port']
  )

end
