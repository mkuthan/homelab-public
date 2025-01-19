# Proxmox

## Datacenter Configuration

### Cluster

* Add all Proxmox nodes to the cluster.
* Note: QDevice doesn't appear in the GUI, use `pvecm status` to check the status.

```
Cluster information
-------------------
Name:             wieprz
Config Version:   3
Transport:        knet
Secure auth:      on

Quorum information
------------------
Date:             Wed Dec 18 19:46:13 2024
Quorum provider:  corosync_votequorum
Nodes:            2
Node ID:          0x00000002
Ring ID:          1.5e
Quorate:          Yes

Votequorum information
----------------------
Expected votes:   3
Highest expected: 3
Total votes:      3
Quorum:           2
Flags:            Quorate Qdevice

Membership information
----------------------
    Nodeid      Votes    Qdevice Name
0x00000001          1    A,V,NMW 192.168.10.31
0x00000002          1    A,V,NMW 192.168.10.30 (local)
0x00000000          1            Qdevice 
```

### Options

Use dedicated network interface (2.5Gbps) for VMs migration/replication.

Options → Migration Settings: `network=10.0.10.0/24`

### Storage

Storage is managed by Ansible, use `pvesm status` to show storage.

```
Name          Type     Status           Total            Used       Available        %
backup     zfspool     active       377946112        34855524       343090588    9.22%
local          dir     active        15887272         4470752        10587696   28.14%
local1         dir     active       211995148         1358072       199795528    0.64%
pbs            pbs     active       377942784        34852224       343090560    9.22%
pool0      zfspool     active       377946112        78083740       299862372   20.66%
smb        zfspool     active       377946112         9399216       368546896    2.49%
usb1           dir     active       479596544         9668608       445492224    2.02%
usb2           dir     active     11625369600      7859975168      3179433984   67.61%
```

### Backup

See [Backup](backup.md) page.

### Replication and HA

Define replication for:

* all VMs/containers defined to run in HA mode
* PBS container together with backup pool

Show replication status using `pvesr status`.

```
JobID      Enabled    Target                           LastSync             NextSync   Duration  FailCount State
100-0      Yes        local/pve1            2024-12-18_06:00:00  2024-12-19_06:00:00  13.768198          0 OK
141-0      Yes        local/pve1            2024-12-18_18:00:06  2024-12-18_20:00:00   4.122741          0 OK
145-0      Yes        local/pve1            2024-12-18_19:30:00  2024-12-18_20:00:00   4.014435          0 OK
146-0      Yes        local/pve1            2024-12-18_19:30:04  2024-12-18_20:00:00    3.77723          0 OK
147-0      Yes        local/pve1            2024-12-18_19:30:08  2024-12-18_20:00:00   5.326528          0 OK
148-0      Yes        local/pve1            2024-12-18_18:00:10  2024-12-18_20:00:00   3.797746          0 OK
```

Mark all important VMs/containers as HA.
Use `ha-manager status` to check the status.

```
quorum OK
master pve0 (active, Wed Dec 18 19:56:46 2024)
lrm pve0 (active, Wed Dec 18 19:56:46 2024)
lrm pve1 (idle, Wed Dec 18 19:56:48 2024)
service ct:100 (pve0, started)
service ct:101 (pve1, started)
service ct:132 (pve0, started)
service ct:133 (pve0, started)
service ct:134 (pve0, started)
service ct:135 (pve0, started)
service ct:136 (pve0, started)
service ct:137 (pve0, started)
service ct:138 (pve0, started)
service ct:139 (pve0, started)
service ct:141 (pve0, started)
service ct:142 (pve0, started)
service ct:143 (pve0, started)
service ct:144 (pve0, started)
service ct:145 (pve1, started)
service ct:146 (pve1, started)
service ct:148 (pve0, started)
service vm:147 (pve1, started)
```

### Permissions

Create user with limited permissions for prometheus exporter:

* Permissions → User: `exporter@pve` with `PVEAuditor` role
* Permissions → User: `ansible@pve` with `PVEAuditor` role

### Notifications

Send notifications using SMTP server.

1. Disable default `mail-to-root` notification target.
2. Add `smtp` target:

    * Type: `smtp`
    * Server: `smtp.gmail.com`
    * Port: `587`
    * Encryption: `STARTTLS`
    * From address: `<pve@wieprz.online>`
    * Recipient(s): `root@pam` (define email address for this account)

3. Change `default-matcher` to use `smtp` notification target.
4. Add match rule by severity: `Warning`, `Error` and `Unknown`.
5. Set match rule to match if `All rules match`.

## Nodes Configuration

System → DNS

* Search domain: `wieprz.online`
* DNS server 1: `192.168.10.1`

## Container templates

Download Debian 12 template:

```shell
pveam download local debian-12-standard_12.7-1_amd64.tar.zst
```

Create Debian 12 container template:

```shell
pct create 1001 local:vztmpl/debian-12-standard_12.7-1_amd64.tar.zst \
    --arch amd64 \
    --cores 1 \
    --hostname lxc-template \
    --memory 512 \
    --net0 name=eth0,bridge=vmbr0,gw=192.168.10.1,type=veth \
    --ostype debian \
    --rootfs pool0:basevol-1000-disk-0,size=8G \
    --swap 512 \
    --template 1
```

## VM templates

Create Home Assistant VM template:

```bash
qm create 1001 --name haos-template-11.5
qm importdisk 1001 haos_ova-11.5.qcow2 pool0
qm set 1001 -scsi0 pool0:vm-1001-disk-0
```

Create Ubuntu 24.04 VM template:

```bash
qm create 1002 --name ubuntu-template-24.04
qm importdisk 1002 ubuntu-24.04-server-cloudimg-amd64.img pool0
qm set 1002 -scsi0 pool0:vm-1001-disk-0
```

## Useful commands

### Smartctl

Check USB external disks of `-d sat` type:

```shell
smartctl -a -d sat /dev/sdb
smartctl -a -d sat /dev/sdc
```

### Logs

Filter errors (`-p 3`) from the current boot (`-xb`):

```shell
journalctl -p 3 -xb
```

## NFS

Show NFS shares on the server:

```shell
exportfs -v
```

Show NFS shares on the client:

```shell
showmount -e 10.0.10.31
```

## GPU

Show GPU usage:

```shell
intel_gpu_top
```