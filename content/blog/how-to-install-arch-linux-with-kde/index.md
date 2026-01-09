---
title: "How to Install Arch Linux with KDE"
description: "How to Install Arch Linux with KDE Plasma desktop environment."
summary: "How to Install Arch Linux with KDE Plasma desktop environment."
date: 2026-01-08
draft: false
tags: ["KDE", "Arch", "Linux"]
---

## Preparation and Live Environment

### Download

Download the ISO from [archlinux.org](https://archlinux.org/download/) and verify the Checksums using `sha256sum`.

```sh
sha256sum archlinux-2026.01.01-x86_64.iso | grep 16502a7c18eed827ecead95c297d26f9f4bd57c4b3e4a8f4e2b88cf60e412d6f
```

### Flash

Flash it to a USB drive using a tool like `dd` or [BalenaEtcher](https://etcher.balena.io/#download-etcher).

```sh
dd bs=4M if=archlinux-2026.01.01-x86_64.iso of=/dev/sda conv=fsync oflag=direct status=progress
```

Note: Replace `/dev/sda` with the correct device name for your USB drive.

### Boot

Plug the USB into your PC, enter your BIOS/Boot menu, and select the USB drive.

### Connect to Internet

Ethernet should work automatically. For Wi-Fi, Run `iwctl`, then `device list`, scan networks using `station wlan0 scan`, then `station wlan0 get-networks`, connect to a network using `station wlan0 connect "<SSID>"`.

Update System Clock: `timedatectl set-ntp true`

## Partitioning the Disk

This is the most important step. We will create two partitions: 
- EFI (1GB)
- Root (the rest).

You might be familiar with allocating a third partition for swap space (4GB-8GB), but that's not necessary. Using a swap file within an existing partition achieves the same performance and can be more flexible.

While a 512MB EFI partition is sufficient if disk space is limited, allocating 1GB is recommended to provide better long-term flexibility.

### Identify your drive

Run `fdisk -l`. (Usually `/dev/sda` or `/dev/nvme0n1`)

### Partitioning

Use `fdisk` to partition the disk.

```sh
fdisk /dev/nvme0n1
```

Note: Replace `/dev/nvme0n1` with the correct device name for your disk.

In `fdisk`:
- type `g` to create new GPT partition table.
- type `n` to create a new partition.
- type `1` to select the first partition.
- press Enter to accept the default start sector.
- type `+1G` to set the size of the partition to 1GB.
- type `t` to change the partition type.
- type `ef` to set the partition type to EFI System.
- type `n` to create a new partition.
- type `2` to select the second partition.
- press Enter to accept the default start sector.
- press Enter to accept the default end sector.
- type `w` to write the changes to disk.

### Formatting

EFI partition:
```sh
mkfs.fat -F32 /dev/nvme0n1p1
```

Root partition:

- Btrfs file system
```sh
mkfs.btrfs -L arch_root /dev/nvme0n1p2
```

- or, Ext4 file system
```sh
mkfs.ext4 /dev/nvme0n1p2
```

## Installation

### Setup mirrors

Sync the `pacman` repository and install `reflector` to update the mirror list based on download speed.
```sh
pacman -Syy
pacman -S reflector
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
reflector --latest 100 --protocol https --sort rate --save /etc/pacman.d/mirrorlist --number 20
```

### Base Installation

Mount Root:
```sh
mount /dev/nvme0n1p2 /mnt
```

Mount EFI:
```sh
mount --mkdir /dev/nvme0n1p1 /mnt/boot
```

Install Base Packages:
```sh
pacstrap /mnt base linux linux-firmware nano vim
```

Generate Fstab:
```sh
genfstab -U /mnt >> /mnt/etc/fstab
```

## System Configuration

### Enter your new system:

```sh
arch-chroot /mnt
```

### Timezone:

```sh
ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
hwclock --systohc
```

### Localization:

Uncomment the desired locale in `/etc/locale.gen`
- `en_US.UTF-8 UTF-8`

Generate the locale using `locale-gen`. Set the locale in `/etc/locale.conf`
```sh
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
```

### Network:

Set hostname:
```sh
echo "your-cool-hostname" > /etc/hostname
```

Install and enable NetworkManager:
```sh
pacman -S networkmanager
systemctl enable NetworkManager
```

### Users:

Set root password:
```sh
passwd
```

Create a user:
```sh
pacman -S sudo
useradd -m username
usermod -aG wheel,audio,video,storage username
passwd username
```

Edit `/etc/sudoers` (uncomment the line `%wheel ALL=(ALL) ALL`):
```sh
EDITOR=vim visudo
```


## Bootloader and Desktop Environment

### Bootloader (GRUB):

For UEFI systems:
```sh
pacman -S grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
```

For Non-UEFI systems:
```sh
pacman -S grub
grub-install /dev/nvme0n1
grub-mkconfig -o /boot/grub/grub.cfg
```

### Drivers:

Intel:
```sh
pacman -S xf86-video-intel intel-ucode mesa vulkan-intel intel-media-driver libva-utils
```

AMD:
```sh
pacman -S xf86-video-amdgpu amd-ucode mesa vulkan-radeon libva-mesa-driver
```


### KDE Plasma Installation:

```sh
pacman -S xorg plasma-meta plasma-wayland-session sddm konsole dolphin
systemctl enable sddm
```

## Finishing Up

```
exit
umount -R /mnt
reboot
```

## Optional Packages

Install additional packages - some apps and tools that i use:
```sh
sudo pacman -S --needed 7zip a52dec ark base base-devel bash-completion bluez-utils btrfs-progs chromium dolphin dosfstools exfatprogs faac faad2 firefox fwupd git go gst-libav gst-plugin-pipewire gst-plugins-bad gst-plugins-good gst-plugins-ugly guvcview hashcat hashcat-utils iw jdk-openjdk john konsole less libdca libdv libmad libmpeg2 libreoffice-fresh libva-utils linux linux-firmware mesa mpv nano neochat networkmanager ntfs-3g obs-studio obsidian okular openssh partitionmanager pipewire-alsa plasma-meta python-pip qbittorrent qemu-full reflector sddm sof-firmware speech-dispatcher sudo symlinks thunderbird torbrowser-launcher unbound usbutils vim virt-manager virt-viewer wavpack weechat xfsprogs yt-dlp zed
```


<br>

Happy Hacking

<br>

---
