# ansible_role_consul_config

ansible role to configure consul

https://galaxy.ansible.com/suzuki-shunsuke/consul_config

[![GitHub last commit](https://img.shields.io/github/last-commit/suzuki-shunsuke/ansible_role_consul_config.svg)](https://github.com/suzuki-shunsuke/ansible_role_consul_config)
[![GitHub tag](https://img.shields.io/github/tag/suzuki-shunsuke/ansible_role_consul_config.svg)](https://github.com/suzuki-shunsuke/ansible_role_consul_config/releases)

This role doesn't install consul.
If you want to install, please use [akoi](https://github.com/suzuki-shunsuke/akoi) and [suzuki-shunsuke.akoi](https://github.com/suzuki-shunsuke/ansible_role_akoi).

```yaml
packages:
  consul:
    url: "https://releases.hashicorp.com/consul/{{.Version}}/consul_{{.Version}}_linux_amd64.zip"
    version: 1.2.1
    files:
    - name: consul
      archive: consul
```

## Directory Structure

* user: `consul_user` default:consul
* group: `consul_group` default:consul

```
data_dir/ default:/opt/consul
consul_pid_file default:/var/run/consul/consul.pid
consul_config_file default:/etc/consul/consul.json
consul_configd_path/ default:/etc/consul/consul.d/
  service.json
consul_service_unit_file default:/etc/systemd/system/consul.service
```

## Requirements

* systemd

## Role Variables

Required variables are nothing.
Please see

* [defaults/main.yml](defaults/main.yml)
* [vars/main.yml](vars/main.yml)
* [tasks/assert.yml](tasks/assert.yml)

## Example Playbook

```yaml
- hosts: servers
  roles:
  - role: suzuki-shunsuke.consul_config
    consul_path: /usr/local/bin/consul
    consul_config_files:
      web:
        service:
          name: web
          tags:
          - rails
          port: 80
    become: yes
```

## Change Log

See [CHANGELOG.md](CHANGELOG.md).

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

[MIT](LICENSE)
