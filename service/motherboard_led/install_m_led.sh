#!/bin/bash

pip install hidapi

systemctl daemon-reload
systemctl enable $(pwd)/m_led.service
systemctl enable $(pwd)/reload_m_led.service
systemctl start m_led.service
systemctl start reload_m_led.service
