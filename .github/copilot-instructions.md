Use Ansible fully-qualified modules names

Keep the following elements order for `community.docker.docker_container`: `name`, `image`, `env`, `volumes`, `command`

For each `community.docker.docker_container` define: `ports: "{{ name_ports | default([]) }}"`, where `name` follows Ansible role name

For each `community.docker.docker_container` define at the end fixed section:

```
    networks: "{{ docker_networks }}"
    comparisons: "{{ docker_comparisons }}"
    image_name_mismatch: "{{ docker_image_name_mismatch }}"
    state: "{{ docker_state }}"
    restart_policy: "{{ docker_restart_policy }}"
    pull: "{{ docker_pull }}"
```
