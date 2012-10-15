install = (node[:htpasswd][:action] == "install")

package "openssl"

directory node[:htpasswd][:dir] do
  mode "0755"
  action (install ? :create : :delete)
  recursive true
end

if install
  node[:htpasswd][:identities].each do |identity|
    htpasswd_identity identity[:name] do
      files identity[:files]
      password identity[:password]
      type identity[:type]
      action identity[:action]
    end
  end
end
