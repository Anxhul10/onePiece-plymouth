#!/bin/bash

osCheck() {
    if [[ $OSTYPE == "linux-gnu" ]]; then
        return 1
    fi
    return 0
}

if [ osCheck $1 ]; then
    if [[ "$(id -u)" -ne 0 ]]; then
        echo "Please run this as root"
    else 
        read -p "Enter the priority of plymouth : " priority < /dev/tty
        cd  /usr/share/plymouth/themes
        sudo git clone https://github.com/Anxhul10/onePiece-plymouth.git
        sudo update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/onePiece-plymouth/onePiece-plymouth.plymouth $priority
        sudo update-alternatives --config default.plymouth
        sudo update-initramfs -u
        cd onePiece-plymouth/
        # ask user for fast and slow animation
        echo "###############################################"
        echo "choose animation speed:"
        echo "1. faster animation"
        echo "2. slower animation"
        read -n 1 -p "Enter the choice(eg. 1 or 2) : " choice < /dev/tty

        if [[ $choice == 1 ]]; then
            printf "\nfast animation enabled !!"
        fi
        if [[ $choice == 2 ]]; then
            cp onePiece-plymouth-slow.script onePiece-plymouth.script
            printf "slow animation enabled !!"
        fi
    fi
else 
    echo "Please use linux-gnu"
fi

