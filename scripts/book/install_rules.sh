#!/bin/bash

sudo cp ./99-power-plug-performance.rules /etc/udev/rules.d/99-power-plug-performance.rules
sudo udevadm control --reload

