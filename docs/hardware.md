# Hardware

## Network

* Radio modem [Ubiquiti airMAX LiteBeam 5AC](https://eu.store.ui.com/eu/en/pro/products/litebeam-5ac)
* Router [ER605](https://www.tp-link.com/en/business-networking/vpn-router/er605/)
* Switch PoE [TL-SG2428P](https://www.tp-link.com/en/business-networking/omada-switch-poe/tl-sg2428p/v1/)
* Access point [EAP610](https://www.tp-link.com/en/business-networking/omada-wifi-ceiling-mount/eap610/v3/)

## Server

Dell Optiplex 5070 Micro (pve0):

* CPU Intel i5-9500T 2.2-3.7GHz, 6 cores
* GPU Intel® HD Graphics 630
* 16GB RAM - TODO
* 256 GB SSD, Samsung PM981 (NVMe, TLC)
* 1.6TB SSD, Intel DC S3610 (SATA, MLC)
* PCI Express 3.0
* Built-in Gigabit Ethernet card
* PCIe M.2 A+E 2.5Gb RTL8125B network card
* USB 3.1 Gen 2 x 1 Type-C
* USB 3.1 Gen 1 x 5
* Power Supply 90W, 4.5x3.0mm
* Service Tag: 7YMRK33
* Bios Version: 1.30.1

Dell Optiplex 5070 Micro (pve1):

* CPU Intel i5-9500T 2.2-3.7GHz, 6 cores
* GPU Intel® HD Graphics 630
* 16GB RAM - TODO
* 256 GB SSD, Samsung PM981 (NVMe, TLC)
* 800GB SSD, Intel DC S3610 (SATA, MLC)
* PCI Express 3.0
* Built-in Gigabit Ethernet card
* PCIe M.2 A+E 2.5Gb RTL8125B network card
* USB 3.1 Gen 2 x 1 Type-C
* USB 3.1 Gen 1 x 5
* Power Supply 65W, 4.5x3.0mm
* Service Tag: HLM8263
* Bios Version: 1.32.0

Dell Wyse 3040 (pve2/qdevice):

* CPU Intel Atom x5-Z8350 1.44GHz, 4 cores
* 2 GB RAM DDR3L 1600 MHz
* 8 GB eMMC
* Built-in Gigabit Ethernet card
* PCIe M.2 A+E Intel Dual-Band Wireless-AC 8265 card
* USB 3.0
* USB 2.0 x 3
* Power consuption 1.37W/4.9W
* Power Supply 15W, 4x1.7mm
* Service Tag: G7LLKW2
* Bios Version: 1.2.5

Dell Optiplex 3050 Micro (spare):

* CPU Intel i5-7500T 2.7-3.3GHz, 4 cores
* GPU Intel® HD Graphics 630
* 16GB RAM DDR4 2666MHz
* 256 GB SSD
* PCI Express 3.0
* Built-in Gigabit Ethernet card
* USB 3.0 Gen 1 x 4
* USB 2.0 x 2
* Service Tag: 5MTZ7N2
* Bios Version: 1.32.0

Spare parts:

* 512GB 2.5 HDD, Seagate [ST500LM021](https://www.seagate.com/www-content/product-content/momentus-fam/momentus-thin/en-us/docs/100737930b.pdf)
* 512GB 2.5 HDD, Seagate [ST9500420AS](https://www.seagate.com/docs/pdf/datasheet/disc/ds_momentus_7200_4.pdf)
* Micro VGA connector
* Micro DP connector

See also:

* <https://en.wikipedia.org/wiki/Dell_OptiPlex>
* <https://www.hardware-corner.net/guides/difference-optiplex-3050-5050-7050/>
* <https://www.hardware-corner.net/guides/difference-optiplex-3070-5070-7070/>

Show DELL service tag:

```bash
dmidecode -s system-serial-number
```

Check DELL BIOS version:

```bash
dmidecode -s bios-version
```

## External disks

* "USB1" - WD Gold 14TB [WD142KRYZ](https://www.westerndigital.com/products/internal-drives/wd-gold-sata-hdd?sku=WD142KRYZ)
* "USB2" - WD Purple Pro 12TB [WD121PURP](https://www.westerndigital.com/products/internal-drives/wd-purple-pro-sata-hdd?sku=WD121PURP)

Check USB external disks of `-d sat` type:

```shell
smartctl -a -d sat /dev/sdb
```

Run short disk self-test:

```shell
smartctl -t short -d sat /dev/sdb
```
