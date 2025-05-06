# Cameras

* Dahua Bullet 8Mpx, 1/2.7" CMOS, IPC-HFW2841S-S
* Dahua Bullet 4Mpx, 1/3” CMOS, IPC-HFW2431S-S-S2
* Dahua Eyeball 4Mpx, 1/1.8" CMOS, IPC-HDW5442TM-ASE-S3
* Dahua Eyeball 4Mpx, 1/2.9" CMOS, IPC-HDW2441TM-S

<https://dahuawiki.com/Name_Rule#IP_Camera>

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
* FPS: 10
* I Frame Interval: 20
* Resolution: 3840 × 2160 for 8Mpx, 2688 × 1520 for 4Mpx
* BitRate: 6114Kb/s for 8Mpx, 3072Kb/s for 4Mpx
* Watermark: Off

Substream:

* Codec: H.264
* FPS: 5
* I Frame Interval: 5
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

2.880.0000000.16.R, Build Date: 2024-08-30

* IPC-HFW2841S-S-0280B
* IPC-HFW2841S-S (china)

2.840.0000000.14.R, Build Date: 2023-11-24

* IPC-HDW2441TM-S-0280B

2.820.0000000.60.R, Build Date: 2023-10-21

* IPC-HDW2431S-S2 (china)

V3.142.0000000.3.R, Build Date: 2024-09-24

* IPC-HDW5442TM-ASE-S3/IPC-T54IR-AS-S3  (empiretech)

## Motion Detection

See: [Frigate Ansible role](../ansible/roles/frigate)
