actions :create, :delete

attribute :files,        :kind_of => Array,   :default => ["default"]
attribute :password,     :kind_of => String,  :required => true
attribute :type,         :kind_of => String,  :equal_to => %w[des md5 apache-md5], :default => "md5"

OPENSSL_PASSWD_TYPES = {
  "des"        => "-crypt",
  "md5"        => "-1",
  "apache-md5" => "-apr1"
}

def initialize(*args)
  super
  @action = :create
end

def htpasswd_file(file)
  return @htpasswd_file if @htpasswd_file
  @htpasswd_file = if (file.index("/") == 0)
    file
  else
    "#{node[:htpasswd][:dir]}/#{file}"
  end
end

def generated_password
  return @generated_password if @generated_password
  @generated_password = %x{openssl passwd #{OPENSSL_PASSWD_TYPES[type]} #{password}}.chomp
end

def identity
  return @identity if @identity
  @identity = "#{name}:#{generated_password}"
end
