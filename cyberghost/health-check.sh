#!/bin/bash

if [[ $(sudo cyberghostvpn --status | grep -c "^VPN") -eq 1 ]]; then
    exit 0
else
    exit 1
fi
