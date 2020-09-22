# Arch linux installation instruction

## Install base system

#### 1. Check if EFI is supported
`ls /sys/firware/efi/efivars`
> If the directory contains files, then the system supports EFI

#### 2. Check if internet is reachable
`ip link`  
`ping google.com`

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
`pacstrap /mnt base base-devel intel-ucode linux linux-headers linux-firmware grub efibootmgr neovim git`
> Microcode need to be installed if you have intel or amd  
> Intel -> intel-ucode  
> AMD -> amd-ucode 

#### 7. Generate fstab file
`genfstab -U /mnt >> /mnt/etc/fstab`

#### 8. Change root
`arch-chroot /mnt`

#### 9. Configure timezone
`ln -sf /usr/share/zoneinfo/Europe/Chisinau /etc/localtime`

#### 10. Sync time
`hwclock --systohc`

#### 11. Edit file `/etc/locale.gen` and uncomment the following line
> en_US.UTF-8

#### 12. Generate locale files
`locale-gen`

#### 13. Create a file `/etc/locale.conf` with the following content
> LANG=en_US.UTF-8

#### 14. Edit file `/etc/hostname` and write the following content
> arch-workstation

#### 15. Edit file `/etc/hosts` and write the following content
> 127.0.0.1     localhost  
> ::1           localhost  
> 127.0.1.1     arch-workstation.localdomain arch-workstation

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

#### 1. Clone the config repo
`git clone https://github.com/vitdevelop/config`

#### 2. Cd to install directory
`cd config/install`

#### 3. Run the configuration
`sh install.sh`

#### 4. Reboot

#### 5. After booting into the UI, run the `post-install.sh` script
`cd .config/install`  
`sh post-install.sh`
