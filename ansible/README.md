
# Ansible

This repository contains over 50 roles and 30 playbooks to manage my homelab infrastructure.

## Ansible setup

All host and group variables are encrypted with Ansible vault, password file is `.vault`.

## Ansible commands

Install Ansible roles:

```bash
ansible-galaxy install -r requirements.yml 
```

Update Ansible roles:

```bash
ansible-galaxy install -r requirements.yml  --force
```

Show inventory:

```bash
ansible-inventory --graph
```

Update LXC containers:

```bash
ansible-playbook playbooks/lxc_upgrade
```

Update Docker containers:

```bash
ansible-playbook -e docker_pull=always [playbook]
```

Prune Docker dangling images:

```bash
ansible-playbook playbooks/lxc_docker_prune
```

Execute remote command:

```bash
ansible [pattern] -a [command]
```

Lint Ansible playbooks:

```bash
ansible-lint
```
