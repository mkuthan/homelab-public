# Hardware

## Network

* Radio modem [Ubiquiti airMAX LiteBeam 5AC](https://eu.store.ui.com/eu/en/pro/products/litebeam-5ac)
* Router [ER605](https://www.tp-link.com/en/business-networking/vpn-router/er605/)
* Switch PoE [TL-SG2428P](https://www.tp-link.com/en/business-networking/omada-switch-poe/tl-sg2428p/v1/)
* Access point [EAP610](https://www.tp-link.com/en/business-networking/omada-wifi-ceiling-mount/eap610/v3/)

## Server

Dell Optiplex 5070 Micro:

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
* Power Supply 90W, 7.4x5.0mm
* Service Tag: 7YMRK33
* Bios Version: 1.30.1

Dell Optiplex 3050 Micro:

* CPU Intel i5-7500T 2.7-3.3GHz, 4 cores
* GPU Intel® HD Graphics 630
* 32GB RAM DDR4 2666MHz
* 256 GB SSD, Samsung PM981 (NVMe, TLC)
* 800GB SSD, Intel DC S3610 (SATA, MLC)
* PCI Express 3.0
* Built-in Gigabit Ethernet card
* PCIe M.2 A+E 2.5Gb RTL8125B network card
* USB 3.0 Gen 1 x 4
* USB 2.0 x 2
* Power Supply 65W, 4.5x3.0mm
* Service Tag: 5MTZ7N2
* Bios Version: 1.32.0

Dell Wyse 3040:

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

Spare parts:

* 8GB RAM DDR4 2666Mhz
* 512GB HDD, Seagate ST500LM021
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

* [WD Purple Pro 12TB](https://www.westerndigital.com/products/internal-drives/wd-purple-pro-sata-hdd?sku=WD121PURP)
* [Seagate Momentus ST9500420AS 500GB](https://www.seagate.com/docs/pdf/datasheet/disc/ds_momentus_7200_4.pdf)

Check USB external disks of `-d sat` type:

```shell
smartctl -a -d sat /dev/sdb
smartctl -a -d sat /dev/sdc
```

## UPS

[Eaton 5S UPS 1000VA 600W](https://www.eaton.com/pl/pl-pl/skuPage.5S1000I.html)

Show status using `upsc ups1@192.168.10.32`:

```
battery.charge: 100
battery.charge.low: 20
battery.runtime: 3312
device.mfr: EATON
device.model: 5S 1000
device.type: ups
driver.name: usbhid-ups
driver.parameter.pollfreq: 30
driver.parameter.pollinterval: 2
driver.parameter.port: auto
driver.parameter.synchronous: auto
driver.parameter.vendorid: 0463
driver.version: 2.8.0
driver.version.data: MGE HID 1.46
driver.version.internal: 0.47
driver.version.usb: libusb-1.0.26 (API: 0x1000109)
input.frequency: 50.0
input.voltage: 236.0
outlet.1.desc: PowerShare Outlet 1
outlet.1.id: 2
outlet.1.status: on
outlet.desc: Main Outlet
outlet.id: 1
output.frequency: 50.0
output.voltage: 230.0
ups.beeper.status: enabled
ups.delay.shutdown: 20
ups.delay.start: 30
ups.firmware: 01.12.0018
ups.load: 15
ups.mfr: EATON
ups.model: 5S 1000
ups.power.nominal: 1000
ups.productid: ffff
ups.realpower: 120
ups.status: OL
ups.timer.shutdown: -1
ups.timer.start: -1
ups.vendorid: 0463
```

Show read/write variables using `upsrw ups1@192.168.10.32`:

```
[outlet.1.desc]
Outlet description
Type: STRING
Maximum length: 20
Value: PowerShare Outlet 1

[outlet.desc]
Outlet description
Type: STRING
Maximum length: 20
Value: Main Outlet

[ups.delay.shutdown]
Interval to wait after shutdown with delay command (seconds)
Type: STRING
Maximum length: 10
Value: 20

[ups.delay.start]
Interval to wait before (re)starting the load (seconds)
Type: STRING
Maximum length: 10
Value: 30
```
