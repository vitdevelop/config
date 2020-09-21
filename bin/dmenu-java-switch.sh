#!/bin/bash

choices="Java 11\nJava 14"

chosen=$(echo -e "$choices" | dmenu -fn 'JetBrains Mono:Regular:size=14' -p 'Set Default Java Version' -i)

case "$chosen" in
    'Java 11') sudo archlinux-java set java-11-openjdk ;;
    'Java 14') sudo archlinux-java set java-14-openjdk ;;
esac
