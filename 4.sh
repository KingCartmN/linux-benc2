#!/bin/bash

# Színkódok
RED='\e[31m'
GREEN='\e[32m'
CYAN='\e[36m'
YELLOW='\e[33m'
NC='\e[0m' # Szín visszaállítása

# Kurzor elrejtése
tput civis

# Megszakítás (Ctrl+C) esetén mindent alaphelyzetbe állítunk
trap "tput cnorm; echo -e '${NC}'; clear; exit" INT

clear
echo -e "${CYAN}=== O.R.I.O.N. TACTICAL UPLINK ===${NC}\n"
sleep 1

# ---------------------------------------------------------
# 1. ANIMÁCIÓ: Oda-vissza mozgó szkenner (Radar)
# ---------------------------------------------------------
echo -e "${YELLOW}Kezdeményezem a hálózat pásztázását...${NC}"
width=30
scanner_width=3

# Függvény a szkenner kirajzolásához
draw_scanner() {
    local pos=$1
    local line="["
    for ((j=0; j<=width; j++)); do
        if [[ $j -ge $pos && $j -lt $((pos + scanner_width)) ]]; then
            line="${line}${RED}█${NC}"
        else
            line="${line} "
        fi
    done
    line="${line}]"
    echo -en "\r${line}"
}

# Kétszer megy végig oda-vissza
for loop in {1..2}; do
    # Balról jobbra
    for ((p=0; p<=width-scanner_width+1; p++)); do
        draw_scanner $p
        sleep 0.04
    done
    # Jobbról balra
    for ((p=width-scanner_width; p>=0; p--)); do
        draw_scanner $p
        sleep 0.04
    done
done

echo -e "\n\n${GREEN}[!] Célpont azonosítva.${NC}\n"
sleep 1

# ---------------------------------------------------------
# 2. ANIMÁCIÓ: Mátrix-stílusú "dekódolás"
# ---------------------------------------------------------
echo -e "${YELLOW}Titkosított adatfolyam dekódolása...${NC}"
target_text="CLASSIFIED DATA: PROJECT GENESIS"
current_text=""
# Karakterkészlet a pörgéshez
chars="ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*"

for ((i=0; i<${#target_text}; i++)); do
    t_char="${target_text:$i:1}"
    
    # A szóközöket egyből kiírjuk, nem animáljuk
    if [[ "$t_char" == " " ]]; then
        current_text="${current_text} "
        continue
    fi
    
    # 8-szor pörgetünk egy véletlenszerű karaktert az adott pozíción
    for j in {1..8}; do
        # Véletlenszerű karakter kiválasztása a $chars stringből
        rand_char="${chars:RANDOM%${#chars}:1}"
        echo -en "\r${GREEN}${current_text}${RED}${rand_char}${NC}"
        sleep 0.02
    done
    
    # Véglegesítjük a helyes karaktert
    current_text="${current_text}${t_char}"
    echo -en "\r${GREEN}${current_text}${NC}"
done

echo -e "\n\n${GREEN}[!] Dekódolás sikeres. Drón indítása...${NC}\n"
sleep 1.5

# ---------------------------------------------------------
# 3. ANIMÁCIÓ: Mozgó ASCII objektum (Átrepülő drón)
# ---------------------------------------------------------
# Ehhez a képernyőt töröljük minden képkockánál, és a szóközöket növeljük bal oldalon
for ((i=0; i<=35; i++)); do
    clear
    # Szóközök generálása az eltoláshoz
    spaces=$(printf "%${i}s" "")
    
    echo -e "${CYAN}=== O.R.I.O.N. TACTICAL UPLINK ===${NC}\n"
    echo -e "${YELLOW}Felderítő drón úton a szektorba:${NC} $i / 35\n"
    
    # A drón rajza, eltolva a $spaces változóval
    echo -e "${CYAN}"
    echo "${spaces}   \\  |  /"
    echo "${spaces} --- [O] ---"
    echo "${spaces}   /  |  \\"
    echo -e "${NC}"
    
    sleep 0.08
done

clear
echo -e "${CYAN}=== O.R.I.O.N. TACTICAL UPLINK ===${NC}\n"
echo -e "${GREEN}[ LINK SECURE ] - A drón elérte a célpozíciót.${NC}"
echo -e "Várakozás parancsra...\n"

# Kurzor visszaállítása
tput cnorm
