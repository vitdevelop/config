## Web Greeter configuration

### Run `configure-greeter.sh`
Script will:
- install `accountsservice`
- copy `web-greeter.yaml` config to `/etc/lightdm` directory
- copy `<username>.png` icon to `/var/lib/AccountsService/icons/<username>.png` path
- copy `<username>` accountsservice configuration to `/var/lib/AccountsService/users`

### HiDPI screens
`cd /usr/share/web-greeter/themes/gruvbox/css`

Edit `style.css`, delete constraints and increase zoom
```css
#screen {
  zoom: 1.5
}
```

### Transparent icons
`cd /usr/share/web-greeter/themes/gruvbox`

Edit `index.html`, find `#screen.#login-form.#login-form-box.#user-image.#background-image`, leave it empty, delete `<i class="mdi mdi-account"></i>`.

### User icons
Icon under path: `/home/<username>/.face`, will not be captured by web-greeter.  
Therefore, should be copied in `/var/lib/AccountsService/icons/<username>.png`
