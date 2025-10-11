# AGENTS.md

## Project overview

Ansible-based homelab infrastructure managing Proxmox VE hosts, LXC containers, VPS servers, Raspberry Pi devices,
and self-hosted services (Immich, Jellyfin, Grafana, Prometheus, etc.).

## Running playbooks

- Run playbook: `ansible-playbook playbooks/<service>.yml`
- Dry run (check mode): `ansible-playbook playbooks/<service>.yml --check`

## Code style

- Use 2 spaces for indentation in YAML files
- Quote strings with variables or special characters
- Use `yes`/`no` for booleans (Ansible convention)
- Fully qualified collection names (e.g., `ansible.builtin.template`, `community.docker.docker_compose_v2`)
- Task names in imperative mood: "Install package", "Configure service", "Start daemon"

## Project structure

- `playbooks/` - Top-level orchestration, one per service
- `roles/` - Reusable components, one per service/function
- `group_vars/` - Variables for host groups
- `host_vars/` - Variables for specific hosts
- `inventory.ini` - Static inventory
- `inventory.proxmox.yml` - Dynamic Proxmox inventory

## Ansible conventions

- **Idempotency**: All tasks must be safe to run multiple times
- **Variables**: Define in `group_vars/` or `host_vars/`, never hardcode in playbooks
- **Handlers**: Use for service restarts and config reloads
- **Templates**: Use Jinja2 templates for configuration files (`.j2` extension)
- **Check mode**: Tasks should support `--check` when possible

## Security

- Never commit secrets or passwords
- Use Ansible Vault for sensitive data if needed
- Follow principle of least privilege
