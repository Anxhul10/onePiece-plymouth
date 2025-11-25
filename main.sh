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
        echo "not root"
    else 
        echo "root"
    fi
else 
    echo "Please use linux-gnu"
fi

