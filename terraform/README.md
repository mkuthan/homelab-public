# Terraform

All sensitive data is configured as environment variables.
See `.envrc.default` files for a list of required variables.

Backend configuration is stored in `config.gcs.tfbackend` files.

## Modules

* `gcp` - Cloud resources on Google Cloud Platform (GCP).
* `modules` - Shared modules.
* `tailscale` - Tailscale network configuration.
* `wieprz` - Linux containers on Proxmox servers.

## Commands

```shell
terraform init -backend-config config.gcs.tfbackend
```

```shell
terraform plan -out homelab.tfplan
```

```shell
terrafomr apply homelab.tfplan
```
