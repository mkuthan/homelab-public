# Backup

## Proxmox Backup Server

Configure datastore:

* Name: `backup`
* Path: `/backup`

Configure prune jobs:

* Name: `daily` - 7
* Name: `weekly` - 4

Configure backup user:

* Username: `backup`
* Realm: `pbs`
* Permissions: `Datastore: backup, Role: DatastoreBackup`

Configure notifications like in [Proxmox VE](proxmox.md).

## Proxmox VE

### PBS container

* Hosted on `pve0`
* Replicated to `pve1` at `06:00` (after daily backups)

See [Terraform definition](../terraform/wieprz/main.tf) for container specification.

### Backup jobs

* Container `pbs` to `usb1` storage at `01:30` with keep last set to `7`.
  Recovery for this container must be possible without Proxmox Backup Server running.
* All VMs/containers except `pbs` and Home Assistant to `pbs` storage at `02:00`
* Home Assistant container to `pbs` storage on every hour (`*/1:00`)

## Cloud backup

* Vaultwarden - GCS, already encrypted, don't encrypt again to avoid chicken-egg problem
* Home Assistant - encrypted GCS
* Omada Software Controller - encrypted GCS
* Paperless NGX - encrypted GCS
* Immich (TODO: encrypted GCS)
* Gramps (manual on GCS: TODO: move to encrypted GCS)

### RClone

Rclone Ansible role configuration for backup on Google Cloud Storage (GCS) and Google Drive.

GCS:

```yaml
rclone_gcs_configs:
  - name: backup 
    properties:
      access_key_id: "REDACTED"
      secret_access_key: "REDACTED"

rclone_jobs:
  - name: backup
    src: "/path/to/source"
    dest: "backup:BUCKET_REDACTED/destination_folder"
```

GCS encrypted:

```yaml
rclone_gcs_configs:
  - name: gcs 
    properties:
      access_key_id: "REDACTED"
      secret_access_key: "REDACTED"

rclone_crypt_configs:
  - name: backup
    properties:
      remote: "gcs:BUCKET_REDACTED"
      password: "REDACTED"
      password2: "REDACTED"

rclone_jobs:
  - name: backup
    src: "/path/to/source"
    dest: "backup:/destination_folder"
```

Google Drive:

```yaml
rclone_drive_configs:
  - name: backup
    properties:
      root_folder_id: "REDACTED"      
      client_id: "REDACTED"
      client_secret: "REDACTED"
      token: 'REDACTED'

rclone_jobs:
  - name: backup
    src: "/path/to/source"
    dest: "backup:"
```
