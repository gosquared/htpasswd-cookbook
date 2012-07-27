Sets up a common htpasswd directory, uses openssl directly:

```ruby
:htpasswd => {
  :identities => [
    {
      :name     => "gerhard",
      :password => "secret",
      :files    => %w[admin jenkins], # multiple files support
      :type     => "md5",             # default algorithm, salted
      :action   => :create            # default action, also supports :delete
    }
  ]
```

[How do I generate an .htpasswd file without having Apache tools installed?][1]

[1]: http://wiki.nginx.org/Faq#How_do_I_generate_an_htpasswd_file_without_having_Apache_tools_installed.3F
