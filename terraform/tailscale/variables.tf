variable "tailscale_api_key" {
  type      = string
  sensitive = true
}

variable "tailscale_tailnet" {
  type = string
}
