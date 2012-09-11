action :create do
  new_resource.files.each do |htpasswd_file|
    htpasswd_file = "#{node[:htpasswd][:dir]}/#{htpasswd_file}"
    create_or_update_identity(htpasswd_file)
  end
end

action :delete do
  new_resource.files.each do |htpasswd_file|
    htpasswd_file = "#{node[:htpasswd][:dir]}/#{htpasswd_file}"
    delete_identity(htpasswd_file)
  end
end



#################################################################### IMPLEMENTATION #

def create_or_update_identity(htpasswd_file)
  file htpasswd_file do
    owner "root"
    group "root"
    mode "0644"
    action :create_if_missing
    backup false
  end

  bash "Managing #{new_resource.name} htpasswd identity in #{htpasswd_file}" do
    code %{
      if [[ $(grep -c #{new_resource.name} #{htpasswd_file}) > 0 ]]
      then
        sed -i 's|#{new_resource.name}:.*|#{new_resource.identity}|g' #{htpasswd_file}
      else
        echo "#{new_resource.identity}" >> #{htpasswd_file}
      fi
    }
  end
end

def delete_identity(htpasswd_file)
  bash "Removing #{new_resource.name} htpasswd identity in #{htpasswd_file}" do
    code %{
      if [ -e #{htpasswd_file} ]
      then
        sed -i '\\|#{new_resource.name}:.*| d' #{htpasswd_file}
      fi
      exit 0
    }
  end
end
