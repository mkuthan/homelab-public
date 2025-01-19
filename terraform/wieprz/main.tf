terraform {
  backend "gcs" {
  }

  # backend "local" {
  #   path = "default.tfstate"
  # }

  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "= 3.0.1-rc5"
    }
  }
}

provider "proxmox" {
  pm_api_url  = var.proxmox_url
  pm_user     = var.proxmox_user
  pm_password = var.proxmox_password

  # pm_log_enable = true
  # pm_log_file   = "telmate.log"
  # pm_debug      = true
  # pm_log_levels = {
  #   _default    = "debug"
  #   _capturelog = ""
  # }
}

locals {
  default_ostemplate      = "local1:vztmpl/debian-12-standard_12.7-1_amd64.tar.zst"
  default_ssh_public_keys = file("${path.module}/../ssh_public_keys")
}

# management

module "pbs" {
  source = "../modules/lxc_container"

  ostemplate = local.default_ostemplate

  target_node = "pve0"
  hostname    = "pbs"

  password        = var.default_password
  ssh_public_keys = local.default_ssh_public_keys

  cores  = 2
  memory = 4096

  network_ip = "192.168.10.2/24"
  network_gw = "192.168.10.1"

  nameserver = "192.168.10.1"

  bind_mounts = [
    {
      volume  = "backup:subvol-100-disk-0"
      mp      = "/backup"
      size    = "400G"
      storage = "backup"
    }
  ]
}

module "omada-controller" {
  source = "../modules/lxc_container"

  ostemplate = local.default_ostemplate

  target_node = "pve0"
  hostname    = "omada-controller"

  password        = var.default_password
  ssh_public_keys = local.default_ssh_public_keys

  cores  = 2
  memory = 4096

  network_ip = "192.168.10.3/24"
  network_gw = "192.168.10.1"

  nameserver = "192.168.10.1"
}

module "prometheus" {
  source = "../modules/lxc_container"

  ostemplate = local.default_ostemplate

  target_node = "pve0"
  hostname    = "prometheus"

  password        = var.default_password
  ssh_public_keys = local.default_ssh_public_keys

  cores  = 1
  memory = 1024

  network_ip = "192.168.10.4/24"
  network_gw = "192.168.10.1"

  nameserver = "192.168.10.1"
}

module "grafana" {
  source = "../modules/lxc_container"

  ostemplate = local.default_ostemplate

  target_node = "pve0"
  hostname    = "grafana"

  password        = var.default_password
  ssh_public_keys = local.default_ssh_public_keys

  cores  = 1
  memory = 1024

  network_ip = "192.168.10.5/24"
  network_gw = "192.168.10.1"

  nameserver = "192.168.10.1"
}

module "vaultwarden" {
  source = "../modules/lxc_container"

  ostemplate = local.default_ostemplate

  target_node = "pve0"
  hostname    = "vaultwarden"

  password        = var.default_password
  ssh_public_keys = local.default_ssh_public_keys

  cores  = 1
  memory = 1024

  network_ip = "192.168.10.6/24"
  network_gw = "192.168.10.1"

  nameserver = "192.168.10.1"
}

module "dev" {
  source = "../modules/lxc_container"

  ostemplate = local.default_ostemplate

  target_node = "pve0"
  hostname    = "dev"

  password        = var.default_password
  ssh_public_keys = local.default_ssh_public_keys

  cores       = 5
  memory      = 8192
  rootfs_size = "50G"

  network_ip = "192.168.10.7/24"
  network_gw = "192.168.10.1"

  nameserver = "192.168.10.1"
}

module "frigate" {
  source = "../modules/lxc_container"

  ostemplate = local.default_ostemplate

  target_node = "pve1"
  hostname    = "frigate"

  password        = var.default_password
  ssh_public_keys = local.default_ssh_public_keys

  cores       = 3
  memory      = 4096
  rootfs_size = "20G"

  network_ip = "192.168.10.9/24"
  network_gw = "192.168.10.1"

  nameserver = "192.168.10.1"

  bind_mounts = [
    {
      # TODO: revert to "/mnt/usb2/frigate"
      volume = "/mnt/usb1/frigate"
      mp     = "/media/frigate"
      shared = true
    }
  ]
}

module "mqtt" {
  source = "../modules/lxc_container"

  ostemplate = local.default_ostemplate

  target_node = "pve1"
  hostname    = "mqtt"

  password        = var.default_password
  ssh_public_keys = local.default_ssh_public_keys

  cores  = 1
  memory = 512

  network_ip = "192.168.10.10/24"
  network_gw = "192.168.10.1"

  nameserver = "192.168.10.1"

  unprivileged = true
}

module "whoogle" {
  source = "../modules/lxc_container"

  ostemplate = local.default_ostemplate

  target_node = "pve0"
  hostname    = "whoogle"

  password        = var.default_password
  ssh_public_keys = local.default_ssh_public_keys

  cores  = 1
  memory = 512

  network_ip = "192.168.10.11/24"
  network_gw = "192.168.10.1"

  nameserver = "192.168.10.1"

  unprivileged = true
}

module "mailrise" {
  source = "../modules/lxc_container"

  ostemplate = local.default_ostemplate

  target_node = "pve0"
  hostname    = "mailrise"

  password        = var.default_password
  ssh_public_keys = local.default_ssh_public_keys

  cores  = 1
  memory = 512

  network_ip = "192.168.10.12/24"
  network_gw = "192.168.10.1"

  nameserver = "192.168.10.1"
}

module "loki" {
  source = "../modules/lxc_container"

  ostemplate = local.default_ostemplate

  target_node = "pve0"
  hostname    = "loki"

  password        = var.default_password
  ssh_public_keys = local.default_ssh_public_keys

  cores  = 1
  memory = 1024

  network_ip = "192.168.10.13/24"
  network_gw = "192.168.10.1"

  nameserver = "192.168.10.1"
}

module "apt-cacher" {
  source = "../modules/lxc_container"

  ostemplate = local.default_ostemplate

  target_node = "pve0"
  hostname    = "apt-cacher"

  password        = var.default_password
  ssh_public_keys = local.default_ssh_public_keys

  cores       = 1
  memory      = 1024
  rootfs_size = "20G"

  network_ip = "192.168.10.14/24"
  network_gw = "192.168.10.1"

  nameserver = "192.168.10.1"

  unprivileged = true
}

module "stirling-pdf" {
  source = "../modules/lxc_container"

  ostemplate = local.default_ostemplate

  target_node = "pve0"
  hostname    = "stirling-pdf"

  password        = var.default_password
  ssh_public_keys = local.default_ssh_public_keys

  cores  = 1
  memory = 1024

  network_ip = "192.168.10.15/24"
  network_gw = "192.168.10.1"

  nameserver = "192.168.10.1"

  unprivileged = true
}

module "paperless-ngx" {
  source = "../modules/lxc_container"

  ostemplate = local.default_ostemplate

  target_node = "pve0"
  hostname    = "paperless-ngx"

  password        = var.default_password
  ssh_public_keys = local.default_ssh_public_keys

  cores  = 2
  memory = 4096

  network_ip = "192.168.10.16/24"
  network_gw = "192.168.10.1"

  nameserver = "192.168.10.1"
}

module "z2m-1" {
  source = "../modules/lxc_container"

  ostemplate = local.default_ostemplate

  target_node = "pve1"
  hostname    = "z2m-1"

  password        = var.default_password
  ssh_public_keys = local.default_ssh_public_keys

  cores  = 1
  memory = 1024

  network_ip = "192.168.10.17/24"
  network_gw = "192.168.10.1"

  nameserver = "192.168.10.1"

  unprivileged = true
}

module "gramps" {
  source = "../modules/lxc_container"

  ostemplate = local.default_ostemplate

  target_node = "pve0"
  hostname    = "gramps"

  password        = var.default_password
  ssh_public_keys = local.default_ssh_public_keys

  cores  = 1
  memory = 4096

  network_ip = "192.168.10.18/24"
  network_gw = "192.168.10.1"

  nameserver = "192.168.10.1"

  unprivileged = true
}

module "immich" {
  source = "../modules/lxc_container"

  ostemplate = local.default_ostemplate

  target_node = "pve0"
  hostname    = "immich"

  password        = var.default_password
  ssh_public_keys = local.default_ssh_public_keys

  cores  = 4
  memory = 8192

  network_ip = "192.168.10.19/24"
  network_gw = "192.168.10.1"

  nameserver = "192.168.10.1"

  bind_mounts = [
    {
      volume  = "/mnt/ssd0/immich"
      mp      = "/media/immich"
      shared  = true
    }
  ]
}

# services

module "traefik-0" {
  source = "../modules/lxc_container"

  ostemplate = local.default_ostemplate

  target_node = "pve0"
  hostname    = "traefik-0"
  tags        = ["traefik"]

  password        = var.default_password
  ssh_public_keys = local.default_ssh_public_keys

  cores  = 1
  memory = 512

  network_ip  = "192.168.15.3/24"
  network_gw  = "192.168.15.1"
  network_tag = "15"

  nameserver = "192.168.15.1"
}

module "traefik-1" {
  source     = "../modules/lxc_container"
  ostemplate = local.default_ostemplate

  target_node = "pve1"
  hostname    = "traefik-1"
  tags        = ["traefik"]

  password        = var.default_password
  ssh_public_keys = local.default_ssh_public_keys

  cores  = 1
  memory = 512

  network_ip  = "192.168.15.4/24"
  network_gw  = "192.168.15.1"
  network_tag = "15"

  nameserver = "192.168.15.1"

  unprivileged = true
}

module "adguard" {
  source = "../modules/lxc_container"

  ostemplate = local.default_ostemplate

  target_node = "pve0"
  hostname    = "adguard"

  password        = var.default_password
  ssh_public_keys = local.default_ssh_public_keys

  cores  = 1
  memory = 1024

  network_ip  = "192.168.15.10/24"
  network_gw  = "192.168.15.1"
  network_tag = "15"

  nameserver = "192.168.15.1"
}

module "samba" {
  source = "../modules/lxc_container"

  ostemplate = local.default_ostemplate

  target_node = "pve0"
  hostname    = "samba"

  password        = var.default_password
  ssh_public_keys = local.default_ssh_public_keys

  cores       = 1
  memory      = 512
  rootfs_size = "20G"

  network_ip  = "192.168.15.20/24"
  network_gw  = "192.168.15.1"
  network_tag = "15"

  nameserver = "192.168.15.1"
}

# jump hosts

module "vlan15" {
  source = "../modules/lxc_container"

  ostemplate = local.default_ostemplate

  target_node = "pve0"
  hostname    = "lxc15"
  tags        = ["jump_host"]

  password        = var.default_password
  ssh_public_keys = local.default_ssh_public_keys

  cores  = 1
  memory = 512

  network_ip  = "192.168.15.2/24"
  network_gw  = "192.168.15.1"
  network_tag = "15"

  nameserver = "192.168.15.1"

  unprivileged = true
}

module "vlan20" {
  source = "../modules/lxc_container"

  ostemplate = local.default_ostemplate

  target_node = "pve0"
  hostname    = "lxc20"
  tags        = ["jump_host"]

  password        = var.default_password
  ssh_public_keys = local.default_ssh_public_keys

  cores  = 1
  memory = 512

  network_ip  = "192.168.20.2/24"
  network_gw  = "192.168.20.1"
  network_tag = "20"

  nameserver = "192.168.20.1"

  unprivileged = true
}

module "vlan25" {
  source = "../modules/lxc_container"

  ostemplate = local.default_ostemplate

  target_node = "pve0"
  hostname    = "lxc25"
  tags        = ["jump_host"]

  password        = var.default_password
  ssh_public_keys = local.default_ssh_public_keys

  cores  = 1
  memory = 512

  network_ip  = "192.168.25.2/24"
  network_gw  = "192.168.25.1"
  network_tag = "25"

  nameserver = "192.168.25.1"

  unprivileged = true
}

module "vlan30" {
  source = "../modules/lxc_container"

  ostemplate = local.default_ostemplate

  target_node = "pve0"
  hostname    = "lxc30"
  tags        = ["jump_host"]

  password        = var.default_password
  ssh_public_keys = local.default_ssh_public_keys

  cores  = 1
  memory = 512

  network_ip  = "192.168.30.2/24"
  network_gw  = "192.168.30.1"
  network_tag = "30"

  nameserver = "192.168.30.1"

  unprivileged = true
}

module "vlan40" {
  source = "../modules/lxc_container"

  ostemplate = local.default_ostemplate

  target_node = "pve0"
  hostname    = "lxc40"
  tags        = ["jump_host"]

  password        = var.default_password
  ssh_public_keys = local.default_ssh_public_keys

  cores  = 1
  memory = 512

  network_ip  = "192.168.40.2/24"
  network_gw  = "192.168.40.1"
  network_tag = "40"

  nameserver = "192.168.40.1"

  unprivileged = true
}

module "vlan50" {
  source = "../modules/lxc_container"

  ostemplate = local.default_ostemplate

  target_node = "pve0"
  hostname    = "lxc50"
  tags        = ["jump_host"]

  password        = var.default_password
  ssh_public_keys = local.default_ssh_public_keys

  cores  = 1
  memory = 512

  network_ip  = "192.168.50.2/24"
  network_gw  = "192.168.50.1"
  network_tag = "50"

  nameserver = "192.168.50.1"

  unprivileged = true
}
