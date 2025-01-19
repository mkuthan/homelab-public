variable "gcp_project_id" {
  type = string
}

variable "backup_bucket" {
  type = string
}

variable "backup_region" {
  type = string
  default = "europe-west1"
}

variable "vps_hostname" {
  type = string
}