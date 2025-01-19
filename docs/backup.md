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

```
$ pct config 100
hostname: pbs
cores: 2
memory: 4096
swap: 512
net0: name=eth0,bridge=vmbr0,firewall=1,gw=192.168.10.1,hwaddr=BC:24:11:C0:19:49,ip=192.168.10.2/24,type=veth
rootfs: pool0:subvol-100-disk-0,size=8G
mp0: backup:subvol-100-disk-0,mp=/backup,size=400G
```

### Backup jobs

* Container `pbs` to `usb1` storage at `01:30` with keep last set to `7`. Recovery for this container must be possible without Proxmox Backup Server running.
* All VMs/containers except `pbs` to `pbs` storage at `02:00`

## Cloud backup

TODO: Document Rclone to GCS
