#!/bin/bash

# Set terminal text color to bright green
echo -e "\e[92m"

# Trap Ctrl+C to reset terminal color before exiting
trap "echo -e '\e[0m'; exit" INT

echo "Bypassing mainframe security... Access granted."
sleep 1

# Infinite loop printing random alphanumeric characters
while true; do
    head -c 80 /dev/urandom | tr -dc 'a-zA-Z0-9!@#$%^&*()'
    echo ""
    sleep 0.03
done
