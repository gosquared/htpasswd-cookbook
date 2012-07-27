# Common directory for all htpassword files
#
default[:htpasswd][:dir]        = "/etc/htpasswd"
#
# Declare all your htpasswd identities here, in the format:
# [
#   {
#     :name     => "gerhard",
#     :password => "secret",
#     :type     => "md5",   # default algorithm, salted
#     :action   => :create  # default action, also supports :delete
#   }
# ]
default[:htpasswd][:identities] = []
