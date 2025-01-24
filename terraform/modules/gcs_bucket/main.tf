terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "= 6.2.0"
    }
  }
}
resource "google_storage_bucket" "gcs_bucket" {
  name          = var.gcs_bucket_name
  location      = var.gcs_bucket_location
  storage_class = "STANDARD"

  uniform_bucket_level_access = true

  soft_delete_policy {
    retention_duration_seconds = 2592000 # 30 days
  }

  lifecycle_rule {
    condition {
      age = 31
    }

    action {
      type = "SetStorageClass"
      storage_class = "NEARLINE"
    }
  }

  lifecycle_rule {
    condition {
      age = 91
    }

    action {
      type = "SetStorageClass"
      storage_class = "COLDLINE"
    }
  }

  lifecycle_rule {
    condition {
      age = 366
    }

    action {
      type = "SetStorageClass"
      storage_class = "ARCHIVE"
    }
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "google_storage_bucket_iam_binding" "gcs_bucket_object_user" {
  bucket = google_storage_bucket.gcs_bucket.name

  role = "roles/storage.objectUser"
  members = var.gcs_bucket_object_users
}