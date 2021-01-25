#!/bin/bash

source lib.sh

function getversion() {
    [[ -z GETVERSION_WIDTH_NAME ]] && GETVERSION_WIDTH_NAME=20
    [[ -z GETVERSION_WIDTH_VERSION ]] && GETVERSION_WIDTH_VERSION=20

    printf "%-${GETVERSION_WIDTH_NAME}s | %-${GETVERSION_WIDTH_VERSION}s\n" "Package" "Version"

    namepad=$(printf '%*s' "$GETVERSION_WIDTH_NAME") && namepad=${namepad// /-}
    versionpad=$(printf '%*s' "$GETVERSION_WIDTH_VERSION") && versionpad=${versionpad// /-}
    printf "%s-|-%s\n" $namepad $versionpad

    for name in $@; do
        version=$(eval '_$name 2>/dev/null')
        if [[ $? -eq 0 ]]; then
            printf "%-${GETVERSION_WIDTH_NAME}s | %-${GETVERSION_WIDTH_VERSION}s\n" $name $version
        fi
    done
}
