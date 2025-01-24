# SSH

## Configuration

Configuration in `~/.ssh/config` file:

```
Host bekasow
    Hostname 100.113.217.2
    User pi

Host dev
    Hostname 100.103.66.85
    User marcin

Host pve0
    Hostname 100.65.128.50

Host pve1
    Hostname 100.96.18.66

Host pve2
    Hostname 100.67.72.64

Host vps
    Hostname 100.111.142.62

Host wieprz0
    Hostname 100.120.15.82

Host wieprz1
    Hostname 100.90.156.33

Host *
    User root
    IdentityFile ~/.ssh/homelab_rsa
    UseKeychain yes
    AddKeysToAgent yes
```

## Tunnel

Command:

```bash
ssh -T -L LOCAL_PORT:DESTINATION:DESTINATION_PORT SSH_SERVER
```

For example, tunnel to camera UI through `dev` host:

```bash
ssh -T -L 8080:192.168.30.10:80 dev
```
