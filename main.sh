#!/bin/bash

osCheck() {
    if [ $OSTYPE == "linux-gnu" ]; then
        echo "1 from "
        return 1
    fi
    echo "0 last"
    return 0
}

if [ osCheck $1 ]; then
    if [ "$(id -u)" -ne 0 ]; then
        echo "Please run this as root"
    else 
        cd  /usr/share/plymouth/themes
        sudo git clone https://github.com/Anxhul10/onePiece-plymouth.git
        sudo update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/onePiece-plymouth/onePiece-plymouth.plymouth 250
        sudo update-alternatives --config default.plymouth
        sudo update-initramfs -u
        # ask user for fast and slow animation
    fi
else 
    echo "Please use linux-gnu"
fi

