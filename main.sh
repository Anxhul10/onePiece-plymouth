#!/bin/bash

if [ "$(id -u)" -ne 0 ]; then
    echo "please run as root"
else 
    echo "running as root"
fi
