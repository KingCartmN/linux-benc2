#!/bin/bash

# --- SZÍNEK ÉS STÍLUSOK ---
RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
BLUE='\e[34m'
MAGENTA='\e[35m'
CYAN='\e[36m'
WHITE='\e[37m'

BOLD='\e[1m'
BLINK='\e[5m'
NC='\e[0m' # Reset

# Kurzor elrejtése
tput civis

# BIZTONSÁG: Ha a felhasználó leállítja (Ctrl+C), mindent visszarakunk az eredetire
trap "tput cnorm; echo -e '${NC}'; clear; exit" INT

clear

# =========================================================================
# FÁZIS 1: Memória és Kernel betöltés (Simulated Hex Dump)
# =========================================================================
echo -e "${BOLD}${RED}>>> INITIATING PROJECT OMEGA KERNEL <<<${NC}\n"
sleep 1

# Gyors pörgő memóriacímek és adatok
for i in {1..40}; do
    # Véletlenszerű memóriacím generálása (pl: 0x7ffd5a8b)
    addr=$(printf "0x%08x" $((RANDOM * RANDOM)))
    
    # 4 db véletlenszerű hexadecimális blokk
    hex1=$(printf "%04x %04x" $RANDOM $RANDOM)
    hex2=$(printf "%04x %04x" $RANDOM $RANDOM)
    hex3=$(printf "%04x %04x" $RANDOM $RANDOM)
    
    echo -e "${CYAN}${addr}${NC}  ${hex1}  ${hex2}  ${hex3}  ${YELLOW}[OK]${NC}"
    sleep 0.03
done

echo -e "\n${GREEN}Kernel loaded into RAM. Initializing sub-routines...${NC}"
sleep 1
clear

# =========================================================================
# FÁZIS 2: Párhuzamos folyamatok (Többsoros ANSI animáció)
# =========================================================================
echo -e "${BOLD}${CYAN}--- ESTABLISHING MULTIPLE SATELLITE UPLINKS ---${NC}\n"

# Előkészítünk 4 üres sort a képernyőn
echo ""
echo ""
echo ""
echo ""

# Változók a 4 folyamathoz
p1=0; p2=0; p3=0; p4=0

# Függvény egy progress bar generálására adott százalék alapján
get_bar() {
    local pct=$1
    local color=$2
    local filled=$(( pct / 5 )) # 20 karakter széles bar
    local empty=$(( 20 - filled ))
    local bar_str="${color}"
    for ((j=0; j<filled; j++)); do bar_str="${bar_str}█"; done
    for ((j=0; j<empty; j++)); do bar_str="${bar_str}-"; done
    bar_str="${bar_str}${NC}"
    echo "$bar_str"
}

# Ciklus, amíg minden folyamat el nem éri a 100%-ot
while [[ $p1 -lt 100 || $p2 -lt 100 || $p3 -lt 100 || $p4 -lt 100 ]]; do
    
    # Random sebességgel növeljük a folyamatokat (max 100-ig)
    [[ $p1 -lt 100 ]] && p1=$(( p1 + (RANDOM % 4) + 1 )); [[ $p1 -gt 100 ]] && p1=100
    [[ $p2 -lt 100 ]] && p2=$(( p2 + (RANDOM % 3) + 1 )); [[ $p2 -gt 100 ]] && p2=100
    [[ $p3 -lt 100 ]] && p3=$(( p3 + (RANDOM % 6) + 1 )); [[ $p3 -gt 100 ]] && p3=100
    [[ $p4 -lt 100 ]] && p4=$(( p4 + (RANDOM % 2) + 1 )); [[ $p4 -gt 100 ]] && p4=100

    # ANSI VARÁZSLAT: Visszaugrunk 4 sort felfelé! (\033[4A)
    echo -en "\033[4A"

    # Felülírjuk a 4 sort az új értékekkel
    printf " Uplink Alpha  [ %s ] %3d%%\n" "$(get_bar $p1 $RED)" "$p1"
    printf " Uplink Beta   [ %s ] %3d%%\n" "$(get_bar $p2 $YELLOW)" "$p2"
    printf " Uplink Gamma  [ %s ] %3d%%\n" "$(get_bar $p3 $GREEN)" "$p3"
    printf " Uplink Delta  [ %s ] %3d%%\n" "$(get_bar $p4 $CYAN)" "$p4"

    sleep 0.1
done

echo -e "\n${BOLD}${GREEN}[+] All uplinks synchronized. Bypassing global firewall...${NC}"
sleep 1.5
clear

# =========================================================================
# FÁZIS 3: Célpont keresés (Mátrixos koordináta szkenner)
# =========================================================================
echo -e "${BOLD}${YELLOW}TARGET ACQUISITION MATRIX${NC}\n"

for i in {1..15}; do
    lat=$(( (RANDOM % 180) - 90 )).$(( RANDOM % 9999 ))
    lon=$(( (RANDOM % 360) - 180 )).$(( RANDOM % 9999 ))
    
    echo -en "\r${CYAN}Scanning coordinates:${NC} [ LAT: ${lat} | LON: ${lon} ] "
    sleep 0.1
done
echo -en "\r${GREEN}Scanning coordinates:${NC} [ LAT: 38.8977 | LON: -77.0365 ] ${BOLD}${BLINK}${RED}LOCKED!${NC}      \n"
sleep 1.5

clear

# =========================================================================
# FÁZIS 4: Pulzáló OMEGA AI Mag (Animált nagy ASCII Art)
# =========================================================================

# Ez az animáció 5-ször villan fel ("pulzál")
for pulse in {1..5}; do
    # Kisebb, "összehúzódott" állapot (Sötétkék/Lila)
    clear
    echo -e "${MAGENTA}${BOLD}"
    cat << 'EOF'
            .-------.
          /   _._   \
         |   (   )   |
          \  '---'  /
            '-------'
EOF
    echo -e "${NC}\n        CHARGING..."
    sleep 0.2
    
    # Nagyobb, "kitágult" állapot (Világoskék/Cián)
    clear
    echo -e "${CYAN}${BOLD}"
    cat << 'EOF'
          .-----------.
        /    .-" "-.    \
       |    /  _._  \    |
       |   |  ( O )  |   |
       |    \ '---' /    |
        \    '-...-'    /
          '-----------'
EOF
    echo -e "${NC}\n     POWER SURGE DETECTED"
    sleep 0.2
done

# Végső állapot (Piros, stabil)
clear
echo -e "${RED}${BOLD}"
cat << 'EOF'
        .==============.
      /    .-"    "-.    \
     |    /  __..__  \    |
     |   |  ( OMEGA ) |   |
     |    \  '----'  /    |
      \    '-.____.-'    /
        '=============='
EOF
echo -e "${NC}"
echo -e "${BLINK}${RED}${BOLD}  >>> GLOBAL OVERRIDE INITIALIZED <<<${NC}"
echo -e "${YELLOW}  System control completely transferred to AI Core.${NC}\n"

# Kurzor visszaállítása
tput cnorm
