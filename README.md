# htpasswd chef cookbook

Sets up a common htpasswd directory, uses openssl directly to generate htpasswd files.

## Supported platforms

* Centos 6.5

## Attributes

| Key           | Type       | Default         | Description                                           |
| :------------ |:---------- | :-------------- | :---------------------------------------------------- |
| `dir`         | String     | `/etc/htpasswd` | Common htpasswd directory path                        |
| `action`      | String     | `install`       | Install htpasswd for "install" value                  |
| `identities`  | Array      | `[]`            | List of identities                                    |


### Identities

| Key           | Type       | Default         | Description                                           |
| :------------ |:---------- | :-------------- | :---------------------------------------------------- |
| `name`        | String     | `nil`           | Identity username                                     |
| `password`    | String     | `nil`           | Identity password                                     |
| `files`       | Array      | `["default"]`   | htpasswd files to populate                            |
| `type`        | String     | `md5`           | Password encryption setting: md5, des, apache-md5     |
| `action`      | String     | `create`        | create or delete                                      |

## Usage

Include `htpasswd` in your run_list and set according attributes.

```json
{
  "run_list": [
    "recipe[htpasswd]"
  ]
}
```

## How does it work

This tools uses openssl to hash passwords and manually generate htpasswd files

[How do I generate an .htpasswd file without having Apache tools installed?][1]

[1]: http://wiki.nginx.org/Faq#How_do_I_generate_an_htpasswd_file_without_having_Apache_tools_installed.3F
