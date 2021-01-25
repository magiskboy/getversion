#!/bin/bash

source lib.sh


function getversion() {
    printf "%-20s | %-20s\n" "Package" "Version"
    echo "---------------------|--------------------"

    for p in $@; do
        version=$(eval '_$p 2>/dev/null')
        if [[ $? -eq 0 ]]; then
            printf "%-20s | %-20s\n" $p $version
        fi
    done
}
