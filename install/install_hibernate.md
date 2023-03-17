### Enable swap file

- create swap file  
  `dd if=/dev/zero of=/swapfile bs=4096 count=<count-of-blocks>`
- add swap file to `/etc/fstab` to make sure that will be available after reboot  
  `/swapfile    none    swap    sw  0   0`
- make swap file as swapspace  
  `mkswap /swapfile`
- enable swapspace  
  `chmod 600 /swapfile`  
  `swapon /swapfile`
- check swap
  `swapon` --show

### Enable hibernate

- add to `/etc/mkinitcpio.conf` in `HOOKS` line, after `filesystems`, ex. `filesystems <here> fsck`, `resume` param
- regenerate the initramfs, run `mkinitcpio -p linux`
- get `NAME` path from `lsblk -p` command, where `MOUNTPOINTS` is `/`
- find offset of `/swapfile` on disk
  `filefrag -v /swapfile | awk '$1=="0:" {print substr($4, 1, length($4)-2)}'`
- configure kernel resume and resume_offset with `/swapfile` offset  
  open `/etc/default/grub`, in section `GRUB_CMDLINE_LINUX=""` add  
  `resume=<device_path_to_root> resume_offset=<offset>`
- generate grub
  `sudo grub-mkconfig -o /boot/grub/grub.cfg`
- after restart check if `resume` and `resume_offset` was set, they must be non zero  
  `cat /sys/power/resume`  
  `cat /sys/power/resume_offset`
