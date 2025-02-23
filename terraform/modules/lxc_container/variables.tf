# https://github.com/Telmate/terraform-provider-proxmox/blob/master/docs/resources/lxc.md

variable "ostemplate" {
  type = string
}

variable "target_node" {
  type = string
}

variable "hostname" {
  type = string
}

variable "tags" {
  type    = list(string)
  default = []
}

variable "cores" {
  type    = number
  default = 2
}

variable "memory" {
  type    = string
  default = "1024"
}

variable "swap" {
  type    = string
  default = "512"
}

variable "unprivileged" {
  type    = bool
  default = false
}

variable "onboot" {
  type    = bool
  default = true
}

variable "start" {
  type    = bool
  default = true
}

variable "password" {
  type      = string
  sensitive = true
}

variable "ssh_public_keys" {
  type    = string
  default = null
}

variable "nameserver" {
  type    = string
  default = null
}

variable "network_name" {
  type    = string
  default = "eth0"
}

variable "network_bridge" {
  type    = string
  default = "vmbr0"
}

variable "network_ip" {
  type    = string
  default = "dhcp"
}

variable "network_gw" {
  type    = string
  default = null
}

variable "network_tag" {
  type    = string
  default = null
}

variable "rootfs_storage" {
  type    = string
  default = "pool0"
}

variable "rootfs_size" {
  type    = string
  default = "10G"
}

variable "features_nesting" {
  type    = bool
  default = true
}

variable "bind_mounts" {
  type = list(object({
    volume    = string
    mp        = string
    size      = optional(string)
    storage   = optional(string)
    shared    = optional(bool)
    replicate = optional(bool)
    backup    = optional(bool)
  }))
  default = []
}
