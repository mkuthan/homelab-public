Use Ansible fully-qualified modules names

Keep the following elements order for `community.docker.docker_container`: `name`, `image`, `command`, `env`, `volumes`, `labels`

For each `community.docker.docker_container` define: `ports: "{{ name_ports | default([]) }}"`, where `name` follows Ansible role name

For each `community.docker.docker_container` define fixed section at the end:

```yaml
networks: "{{ docker_networks }}"
comparisons: "{{ docker_comparisons }}"
image_name_mismatch: "{{ docker_image_name_mismatch }}"
state: "{{ docker_state }}"
restart_policy: "{{ docker_restart_policy }}"
pull: "{{ docker_pull }}"
```

Register fact with `docker_container` name for docker based Ansible roles.
