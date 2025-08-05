# Homelab by Marcin

Welcome to my homelab project. This repository contains configurations and documentation for my self-hosted infrastructure.
The purpose of this homelab is to experiment with and manage various technologies and services in a controlled environment,
emphasizing self-hosting, simplicity, and Infrastructure as Code (IaaC) principles.

Manifesto:

* Self-host services and data
* Keep it simple, stupid (KISS)
* Define Infrastructure as a Code (IaaC)

Primary homelab based on Proxmox cluster and virtualization:

![Wieprz](docs/wieprz.jpg)

First homelab built on Raspberry Pi years ago, still in use:

![Bekasow](docs/bekasow.jpg)

## Infrastructure as a Code

Terraform defines the following resources:

* Linux containers (LXC) on Proxmox
* Virtual private server in GCP
* Offsite backup buckets in GCP
* Tailscale access control lists (ACLs)
* See [terraform](terraform) directory for more details

Ansible playbooks manage all the services and configurations, for example:

* Adguard DNS
* Apt Cacher NG
* Backup Ninja
* Docker
* Fluent Bit
* Frigate
* Grafana
* Grafana Agent
* Gramps
* Hyperion NG
* Immich
* Jellyfin
* Kodi
* Loki
* Mailrise
* Mosqquitto
* NUT
* Omada Software Controller
* Open Web UI
* Paperless NGX
* Proxmox Backup Server
* Prometheus
* Raspotify
* RClone
* Samba
* SearXNG
* Shairport
* Stirling PDF
* Tailscale
* Traefik
* Transmission
* Uptime Kuma
* Vaultwarden
* Whoogle
* Zigbee2MQTT
* see [ansible/roles](ansible/roles) for more

## Documentation

If code doesn't tell the whole story, documentation does.
Here are some notes on various topics:

* [Network](docs/network.md): VPN, DNS, VLAN
* [Hardware](docs/hardware.md): network equipment, servers, disks
* [CCTV](docs/cameras.md): cameras, motion detection
* [IoT](docs/iot.md): ZigBee coordinators, sensors, switches
* [Home Assistant](docs/ha.md): Automations, dashboards
* [Photovoltaics](docs/pv.md): Solar panels, batteries
* [Proxmox](docs/proxmox.md): VMs and LXCs management
* [Raspberry Pi](docs/rpi.md): Raspberry Pi OS
* [Backup](docs/backup.md): Proxmox backup server, offisite backups
* [SSH](docs/ssh.md): Remote access to servers
* [Media](docs/media.md): TV box, streaming, audio

As always, I encourage you to visit my blog for more details [https://mkuthan.github.io/tags/#homelab](https://mkuthan.github.io/tags/#homelab).
