terraform {
  backend "gcs" {
  }

  required_providers {
    tailscale = {
      source  = "tailscale/tailscale"
      version = "0.22.0"
    }
  }
}

provider "tailscale" {
  api_key = var.tailscale_api_key
  tailnet = var.tailscale_tailnet
}

locals {
  machines = [
    {
      name = "bekasow.${var.tailscale_tailnet}"
      tags = ["tag:server", "tag:web", "tag:samba"]
    },
    {
      name = "vps.${var.tailscale_tailnet}"
      tags = ["tag:server", "tag:web"]
    },
    {
      name = "wieprz-dev.${var.tailscale_tailnet}"
      tags = ["tag:server"]
    },
    {
      name = "wieprz-pve0.${var.tailscale_tailnet}"
      tags = ["tag:server"]
    },
    {
      name = "wieprz-pve1.${var.tailscale_tailnet}"
      tags = ["tag:server"]
    },
    {
      name = "wieprz-pve2.${var.tailscale_tailnet}"
      tags = ["tag:server"]
    },
    {
      name = "wieprz-samba.${var.tailscale_tailnet}"
      tags = ["tag:server", "tag:samba"]
    },
    {
      name = "wieprz-web0.${var.tailscale_tailnet}"
      tags = ["tag:server", "tag:web"]
    },
    {
      name = "wieprz-web1.${var.tailscale_tailnet}"
      tags = ["tag:server", "tag:web"]
    }
  ]
}

data "tailscale_devices" "devices" {
}

# output "devices" {
#   value = data.tailscale_devices.devices.devices
# }

resource "tailscale_device_tags" "tags" {
  for_each = { for machine in local.machines : machine.name => machine }

  device_id = lookup({ for d in data.tailscale_devices.devices.devices : d.name => d.id }, each.key, null)
  tags      = each.value.tags
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
