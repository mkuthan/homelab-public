terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "= 3.0.1-rc5"
    }
  }
}

resource "proxmox_lxc" "lxc_container" {
  ostemplate = var.ostemplate

  target_node = var.target_node
  hostname    = var.hostname

  tags = join(",", concat(var.tags, ["terraform"]))

  cores  = var.cores
  memory = var.memory
  swap   = var.swap

  unprivileged = var.unprivileged

  onboot = var.onboot
  start  = var.start

  password        = var.password
  ssh_public_keys = var.ssh_public_keys

  nameserver = var.nameserver
  network {
    name   = var.network_name
    bridge = var.network_bridge
    ip     = var.network_ip
    gw     = var.network_gw
    tag    = var.network_tag
  }

  rootfs {
    storage = var.rootfs_storage
    size    = var.rootfs_size
  }

  features {
    nesting = var.features_nesting
  }

  dynamic "mountpoint" {
    for_each = var.bind_mounts
    content {
      key       = mountpoint.key
      slot      = mountpoint.key
      volume    = mountpoint.value["volume"]
      mp        = mountpoint.value["mp"]
      size      = mountpoint.value["size"]
      storage   = mountpoint.value["storage"]
      shared    = mountpoint.value["shared"]
      replicate = mountpoint.value["replicate"]
      backup    = mountpoint.value["backup"]
    }
  }

  lifecycle {
    ignore_changes = [ostemplate, target_node, hastate]
  }
}
