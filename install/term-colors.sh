#!/bin/bash

for i in {0..255} ; do
    printf "${i} - \x1b[38;5;${i}mcolour${1}\n"
done
