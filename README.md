# ansible_role_consul_config

ansible role to configure consul

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
