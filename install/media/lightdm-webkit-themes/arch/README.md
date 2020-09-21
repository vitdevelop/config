# Arch

## Installation

1. Download the theme
2. Unzip the contents on the folder /usr/share/lightdm-webkit/themes/arch
3. Edit the file [etc lightdm lightdm webkit greeter conf](/etc/lightdm/lightdm-webkit-greeter.conf) and set the
"webkit-theme" property to "arch".
4. Make sure the property "greeter-session" in
/etc/lightdm/lightdm.conf is set to "lightdm-webkit-greeter" (or
"lightdm-webkit2-greeter").

And that should be it!

## Keyboard Shortcuts

- Alt + R: Restart
- Alt + D: Shutdown
- Alt + H: Hibernate
- Alt + P: Suspend
- Alt + S or Alt + C: Cycle through the session options
- Tab: Move focus between username and password fields
- Enter: Log In
