# Raspberry Pi

## Installation

The repository is tested against Raspberry Pi OS Lite 64 bit (Debian 12 "Bookworm").

1. Install image on SD card
2. Append `ip=«IP»::«Gateway IP»:«Netmask»` into `cmdline.txt`

## Raspberry Pi’s VideoCore

Available commands:

```shell
vcgencmd commands
```

Show the current configuration:

```shell
vcgencmd get_config int
```

## Audio

Show available playback devices:

```shell
aplay -l
```

Show current mixer settings for device N (0, 1, 2...):

```shell
amixer -c N
```

## TV

Scan for CEC devices:

```shell
cec-client -l
```

Show connected CEC device N (1, 2):

```shell
cec-client -s -d N
```
