#!/bin/bash
while true; do

    #GPU_DATA=$(nvidia-smi --query-gpu=utilization.gpu,temperature.gpu --format=csv,nounits,noheader | sed 's/\\([0-9]\\+\\), \\([0-9]\\+\\)/\\1% 🖥️ \\2°C 🌡️/g')
    RAW=$(nvidia-smi --query-gpu=utilization.gpu,temperature.gpu --format=csv,nounits,noheader)
    
    # Split into variables
    LOAD=$(echo $RAW | cut -d',' -f1 | tr -d ' ')
    TEMP=$(echo $RAW | cut -d',' -f2 | tr -d ' ')

    # Construct the string with literal icons
    # Use actual glyphs here, not codes, if possible
    OUTPUT="${LOAD}% 🖥  ${TEMP}°C 🌡"
    echo "{\"text\": \"$OUTPUT\", \"tooltip\": \"NVIDIA GPU Statistics\"}"
    sleep 2
done
