variable "proxmox_url" {
  type = string
}

variable "proxmox_user" {
  type = string
}

variable "proxmox_password" {
  type      = string
  sensitive = true
}

variable "default_password" {
  type      = string
  sensitive = true
}
