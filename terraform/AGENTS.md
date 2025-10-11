# AGENTS.md

## Project overview

Terraform-based homelab infrastructure managing cloud resources on Google Cloud Platform (GCP), Proxmox LXC containers, and Tailscale network configuration. Infrastructure is organized into modules for reusability and maintainability.

## Running Terraform

- Initialize backend: `terraform init -backend-config config.gcs.tfbackend`
- Plan changes: `terraform plan -out homelab.tfplan`
- Apply changes: `terraform apply homelab.tfplan`
- Validate configuration: `terraform validate`
- Format code: `terraform fmt -recursive`

## Code style

- Use 2 spaces for indentation in `.tf` files
- Use lowercase with underscores for resource names: `module.lxc_container`, `var.proxmox_url`
- Group related resources using locals blocks
- Always add descriptive comments for complex configurations
- Use variables for all environment-specific values

## Project structure

- `gcp/` - Google Cloud Platform resources (VPS, GCS buckets)
- `modules/` - Reusable Terraform modules (gcs_bucket, lxc_container)
- `tailscale/` - Tailscale network configuration
- `wieprz/` - Proxmox LXC containers configuration
- `.envrc.default` - Template for required environment variables
- `config.gcs.tfbackend` - Backend configuration for remote state

## Terraform conventions

- **State management**: Use GCS backend for remote state storage
- **Variables**: Define in `variables.tf`, never hardcode sensitive values
- **Modules**: Create reusable modules for common patterns (e.g., lxc_container)
- **Environment variables**: Use `.envrc` files for sensitive data (see `.envrc.default` templates)
- **Version pinning**: Pin provider versions for reproducibility

## Security

- Never commit secrets, passwords, or API keys
- Use environment variables for sensitive data (configured via `.envrc` files)
- Keep `.envrc` files out of version control (add to `.gitignore`)
- Use `pm_tls_insecure = true` only for internal homelab networks
