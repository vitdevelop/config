# Arch linux installation instruction

> If on boot from usb stuck on message `triggering uevents`  
> in grub menu press `e` and append `intel_iommu=on` or `nomodeset` to end of line.  

## Install base system

#### 1. Check if EFI is supported
`ls /sys/firware/efi/efivars`
> If the directory contains files, then the system supports EFI

#### 2. Check if internet is reachable
`ip link`  
`ping google.com`

---
If you doesn't have possiblity to connect throught cable and have wireless use instructions:
```
iwctl
device-list (should output wlan0)
station wlan0 scan
station wlan0 get-networks (should output your Wireless Point Name[wp_name])
station wlan0 connect wp_name
```
If prompt passphrase enter and then exit from `iwctl`  

---

#### 3. Partition the Disk (`/dev/sda` or `/dev/nvme0n1`)
`fdisk -l /dev/sda`  
`cfdisk /dev/sda`
> /dev/sda1 /boot/EFI - EFI Boot (512MB)  
> /dev/sda2 /mnt - ext4 system partition  
> /dev/sda3 /mnt/home - ext4 home partition

#### 4. Format partitions
`mkfs.vfat -F32 /dev/sda1`  
`mkfs.ext4 /dev/sda2`  
`mkfs.ext4 /dev/sda3`

#### 5. Mount partitions
`mount /dev/sda2 /mnt`  
`mkdir /mnt/home`  
`mount /dev/sda3 /mnt/home`

#### 6. Install base packages
`pacstrap /mnt base base-devel linux linux-headers linux-firmware grub efibootmgr neovim git`

> Microcode need to be installed if you have intel or amd  
> Intel -> `intel-ucode`  
> AMD -> `amd-ucode`  
> 
> ---  
> If you need DHCP, install `dhcpcd`

#### 7. Generate fstab file
`genfstab -U /mnt >> /mnt/etc/fstab`

#### 8. Change root
`arch-chroot /mnt`

#### 9. Configure timezone
`ln -sf /usr/share/zoneinfo/Europe/Chisinau /etc/localtime`

#### 10. Sync time
`hwclock --systohc`

#### 11. Edit file `/etc/locale.gen` and uncomment the following line
`en_US.UTF-8`

#### 12. Generate locale files
`locale-gen`

#### 13. Create a file `/etc/locale.conf` with the following content
`LANG=en_US.UTF-8`

#### 14. Edit file `/etc/hostname` and write the following content
`arch-workstation`

#### 15. Edit file `/etc/hosts` and write the following content
```
127.0.0.1     localhost  
::1           localhost  
127.0.1.1     arch-workstation.localdomain arch-workstation
```

#### 16. Set root password
`passwd`

#### 17. Mount efi partition
`mkdir /boot/EFI`  
`mount /dev/sda1 /boot/EFI`

#### 18. Install grub
`grub-install --target=x86_64-efi --efi-directory=/boot/EFI --bootloader-id=GRUB`

#### 19. Generate grub config
`grub-mkconfig -o /boot/grub/grub.cfg`

#### 20. Reboot
`exit`  
`reboot`

---

## Apply configuration

> If you encounter at the start problem with `triggering uevents`  
> now same edit grub pressing `e` and find line where is `quiet splash` or one of this  
> and before it write `nomodeset` and press `F10` to boot

#### 1. Configure network
##### Static IP
Create file `/etc/systemd/network/<interface_name>.network`  
```
[Match]
Name=interface_name

[Network]
Address=192.168.1.2/24
Gateway=192.168.1.1
DNS=192.168.1.1
DNS=8.8.8.8
DNS=8.8.4.4
```

Edit `/etc/resolv.conf`  
```
nameserver 192.168.1.1
nameserver 8.8.8.8
nameserver 8.8.4.4
```  
Start and enable network service  
```
systemctl start systemd-networkd.service
systemctl enable systemd-networkd.service
```
##### Dynamic IP
Start and enable dhcp and network service  
```
systemctl start dhcpcd.service
systemctl enable dhcpcd.service
systemctl start systemd-networkd.service
systemctl enable systemd-networkd.service
```

#### 2. Create user
`useradd -m -U -G wheel -u 1000 username`

#### 3. Set user password
`passwd username`

#### 4. Enable sudo
Set visudo editor  
`export EDITOR=nvim`  

Execute `visudo` and uncomment line `# %wheel ALL=(ALL) ALL`

#### 5. Login with your user

#### 6. Clone the config repo
`git clone https://github.com/vitdevelop/config`

#### 7. Cd to install directory
`cd config/install`

#### 8. Run the configuration
`sh install.sh`

#### 9. Reboot

#### 10. After booting into the UI, run the `post-install.sh` script
`cd .config/install`  
`sh post-install.sh`
