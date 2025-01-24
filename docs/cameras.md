# Cameras

* Dahua Bullet 8Mpx, 4rd gen. [IPC-HFW2841S-S](https://www.dahuasecurity.com/products/All-Products/Network-Cameras/WizSense-Series/2-Series/8MP/IPC-HFW2841S-S)
* Dahua Bullet 4Mpx, 3rd gen. [IPC-HFW2431S-S-S2](https://www.dahuasecurity.com/products/All-Products/Discontinued-Products/Network-Cameras/IPC-HFW2431S-S-S2=S2)
* Dahua Eyeball 4Mpx, 4rd gen. [IPC-HDW2441T-S](https://www.dahuasecurity.com/products/All-Products/Network-Cameras/WizSense-Series/2-Series/4MP/IPC-HDW2441T-S)

## Configuration

* Initial IP address: `192.168.1.108`

Profile management: day/night

Day conditions:

* Auto

Night conditions:

* Exposure mode: manual
* Shutter: 0 ~ as low as possible
* Gain: 0 ~ 75
* Backlight: WDR
* Illuminator mode: manual
* Illuminator brightness: 100

Main stream:

* Codec: H.265
* FPS: 5
* Resolution: 3840 × 2160, 2688 × 1520
* BitRate: 6114Kb/s for 8Mpx, 3072Kb/s for 4Mpx
* Watermark: Off

Substream:

* Codec: H.264
* FPS: 20
* BitRate: 512Kb/s

Audio:

* Encode: G.711A
* Sampling: 8000

Network:

* DHCP with address reservation
* Access platform: off

Event: off everything

System:

* DST: week, last week of march/october, Sun
* NTP server: `0.pl.pool.ntp.org`

## Firmware

2.880.0000000.7.R, Build Date: 2023-10-18 (8Mpx 4rd gen)

* IPC-HFW2841S-S-0280B
* IPC-HFW2841S-S (china)

2.840.0000000.14.R, Build Date: 2023-11-24 (4Mpx 4rd gen)

* IPC-HDW2441TM-S-0280B

2.820.0000000.60.R, Build Date: 2023-10-21 (4Mpx 3rd gen)

* IPC-HDW2431S-S2 (china)

## Motion Detection

See: [Frigate Ansible role](../ansible/roles/frigate)
