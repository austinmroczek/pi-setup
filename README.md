# pi-setup
Raspberry Pi setup instructions and scripts to help me remember everything

## Get the latest image

Download latest [Raspberry Pi OS](https://www.raspberrypi.org/software/operating-systems/)

Burn image to SD card

Add a blank file `ssh.txt` to the boot partition from windows to enable SSH on boot (or use the new Raspberry Pi Imager tool and select that option)

## Set up USB mass storage boot

This will use a flash drive instead of an SD card to host the filesystem.

Follow directions for [USB Mass Storage Boot](https://www.raspberrypi.org/documentation/hardware/raspberrypi/bootmodes/msd.md) 

## raspi-config settings
Use `raspi-config` to:
- set up the time zone
- wireless LAN country
- enable the serial line (for zwave)
- expand the filesystem
- enable serial port if needed

## Disable bluetooth
Add `dtoverlay=disable-bt` to /boot/config.txt and reboot

## Run the script

Get the script
`wget https://github.com/austinmroczek/pi-setup/raw/master/pi-setup.sh`

Allow it to run
`chmod 755 pi-setup.sh`

And run it as root
`./pi-setup.sh`
