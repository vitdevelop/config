#!/bin/bash

sudo cp ./99-power-plug-performance.rules /etc/udev/rules.d/99-power-plug-performance.rules
sudo cp ./60-monitor-plug.rules /etc/udev/rules.d/60-monitor-plug.rules
sudo udevadm control --reload

