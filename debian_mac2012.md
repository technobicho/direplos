# Howto install Debian 12 on MacBook Pro - 2012

## Download iso and copy to USB
- Download iso from https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-12.2.0-amd64-netinst.iso
- Preparing a USB stick using a hybrid CD/DVD image

Ref: https://www.debian.org/releases/stable/amd64/ch04s03.en.html
```console
# cp debian.iso /dev/sdX
# sync
```

## Install OS
- Connect USB stick and press alt key until the bios has started completly
- Select the UEFI media
- Follow the Debian guide: https://www.debian.org/releases/stable/amd64/ to complete the custom OS installation.

## Install Firwmare b43
- Edit apt sources file
```console
# vim /etc/apt/sources.list

## add contrib respository 

deb http://deb.debian.org/debian/ bookworm main non-free-firmware contrib

## save file

# sudo apt update
# sudo apt install firmware-b43-installer
```

## Install NetworkManager
```console
# sudo apt  install network-manager
# systemctl status NetworkManager.service
● NetworkManager.service - Network Manager
     Loaded: loaded (/lib/systemd/system/NetworkManager.service; enabled; vendor preset: enabled)
     Active: active (running) since Tue 2023-09-28 14:50:00 EAT; 1min ago
       Docs: man:NetworkManager(8)
   Main PID: 423 (NetworkManager)
      Tasks: 3 (limit: 2404)
     Memory: 13.6M
        CPU: 303ms
     CGroup: /system.slice/NetworkManager.service
             └─423 /usr/sbin/NetworkManager --no-daemon
```

## Audio
```console
$ sudo apt install pulseaudio pavucontrol
```
You can open pavucontrol through rofi, unmute the audio you should be just fine.

## Brightness control
```console
# sudo apt install brightnessctl
```
