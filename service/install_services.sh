#!/bin/bash

CURRENT_DIR="$(dirname "$(readlink -f "$0")")"

# install runner of services
cp $CURRENT_DIR/reload-custom-services.service /etc/systemd/system/reload-custom-services.service
/bin/systemctl enable reload-custom-services.service

# List of custom services
/bin/systemctl enable --now $CURRENT_DIR/motherboard_led/m-led.service
