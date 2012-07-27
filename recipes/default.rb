package "openssl"

directory node[:htpasswd][:dir] do
  mode "0755"
end

node[:htpasswd][:identities].each do |identity|
  htpasswd_identity identity[:name] do
    files identity[:files]
    password identity[:password]
    type identity[:type]
    action identity[:action]
  end
end
