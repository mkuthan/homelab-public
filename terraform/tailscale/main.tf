terraform {
  backend "gcs" {
  }

  required_providers {
    tailscale = {
      source  = "tailscale/tailscale"
      version = "0.17.2"
    }
  }
}

provider "tailscale" {
  api_key = var.tailscale_api_key
  tailnet = var.tailscale_tailnet
}

locals {
  proxies = [
    "wieprz0.${var.tailscale_tailnet}",
    "wieprz1.${var.tailscale_tailnet}",
    "bekasow.${var.tailscale_tailnet}",
    "vps.${var.tailscale_tailnet}"
  ]
}

data "tailscale_devices" "devices" {
}

# output "devices" {
#   value = data.tailscale_devices.devices.devices
# }

resource "tailscale_device_tags" "tags" {
  for_each = { for device in data.tailscale_devices.devices.devices : device.id => device if contains(local.proxies, device.name) }

  device_id = each.key
  tags      = ["tag:proxy"]
}

data "tailscale_users" "owners" {
  role = "owner"
}

# output "tailscale_owners" {
#   value = data.tailscale_users.owners.users
# }

data "tailscale_users" "members" {
  role = "member"
}

# output "tailscale_members" {
#   value = data.tailscale_users.members.users
# }

resource "tailscale_acl" "acl" {
  acl = templatefile("${path.module}/acl.tftpl",
    {
      owners  = data.tailscale_users.owners.users[*].login_name
      members = data.tailscale_users.members.users[*].login_name
    }
  )
}
