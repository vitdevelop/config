# How to install
1. Install the base arch linux 
2. create your user and allow it to sudo
3. clone the repository into your user home dir
4. Go to `config/install/` folder
5. execute `sh install.sh` or `sh install.sh --colors=always |& ~/install.log` if you want to have logs afterwards
6. after installation, reboot
7. login into X and run `sh .config/install/post-install.sh`
8. reboot

> Done, you have a full arch based distro with BSWPM, POLYBAR and other goodies
