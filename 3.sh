#!/bin/bash

# Terminál színének átállítása világoszöldre
echo -e "\e[92m"

# Ha a felhasználó megszakítja (Ctrl+C), visszaállítjuk a színt
trap "echo -e '\e[0m'; exit" INT

clear
echo "Bypassing mainframe security... Access granted."
echo "Extracting encrypted datastream..."
sleep 1

# Véges hacker adatfolyam (kb. 2-3 másodpercig fut)
for i in {1..50}; do
    head -c 80 /dev/urandom | tr -dc 'a-zA-Z0-9!@#$%^&*()'
    echo ""
    sleep 0.05
done

echo ""
echo "Datastream intercepted. Decrypting payload..."
sleep 1

# Loading bar
echo -n "Progress: ["
for i in {1..40}; do
    echo -n "#"
    sleep 0.05  # A betöltés sebessége
done
echo "] 100% DONE"

sleep 1
clear
echo "Payload successfully decrypted:"
echo ""

# Az ASCII art megjelenítése
cat << 'EOF'
         ____  
       o8%8888,    
     o88%8888888.  
    8'-    -:8888b   
   8'         8888  
  d8.-=. ,==-.:888b  
  >8 `~` :`~' d8888   
  88         ,88888   
  88b. `-~  ':88888  
  888b ~==~ .:88888  
  88888o--:':::8888      
  `88888| :::' 8888b  
  8888^^'        8888b  
 d888            ,%888b.   
d88%             %%%8--'-.  
/88:.__ ,        _%-' ---  -  
   '''::===..-'   =  --.
EOF

echo ""
echo "System compromised."

# Terminál színének visszaállítása az eredetire
echo -e "\e[0m"
