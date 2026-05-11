#!/bin/bash

# Színek definiálása
RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
CYAN='\e[36m'
NC='\e[0m' # Nincs szín (visszaállítás)

# Kurzor elrejtése a szebb animációért
tput civis

# Ha a felhasználó megszakítja (Ctrl+C), visszaállítjuk a kurzort és a színt
trap "tput cnorm; echo -e '\e[0m'; exit" INT

clear
echo -e "${CYAN}Initializing Shadow Protocol...${NC}"
sleep 1

# 1. ANIMÁLT SPINNER (Forgó vonal)
spinners=("-" "\\" "|" "/")
for i in {1..15}; do
    for s in "${spinners[@]}"; do
        # A \r visszaugrik a sor elejére, így egy helyben animál
        echo -en "\rBypassing firewall: [ ${s} ]"
        sleep 0.05
    done
done
# Mikor végzett, zöldre váltja a szöveget
echo -e "\rBypassing firewall: [ ${GREEN}SUCCESS${NC} ]   "
sleep 0.5

# 2. ANIMÁLT PROGRESS BAR SZÁZALÉKKAL
bar=""
total_steps=40
for ((i=1; i<=total_steps; i++)); do
    bar="${bar}#"
    # Százalék kiszámítása
    pct=$(( i * 100 / total_steps ))
    # Üres helyek kiszámítása a zárójelig
    spaces=$(printf "%*s" $((total_steps - i)) "")
    
    echo -en "\rInjecting payload: [${GREEN}${bar}${NC}${spaces}] ${pct}%"
    sleep 0.05
done
echo -e "\nPayload injected. Executing system override..."
sleep 1

# 3. ANIMÁLT ASCII ART (Villogó és változó koponya)
for i in {1..4}; do
    clear
    echo -e "${RED}"
    cat << 'EOF'
         .---.
        /     \
       | >   < |
        \  ^  /
         |||||
EOF
    echo -e "\n   [ CRITICAL SYSTEM ALERT ]"
    sleep 0.3
    
    clear
    echo -e "${YELLOW}"
    cat << 'EOF'
         .---.
        /     \
       | O   O |
        \  ^  /
         |||||
EOF
    echo -e "\n   [ SYSTEM COMPROMISED ]"
    sleep 0.3
done

# Végső, statikus kép (megnyugvó arckifejezés)
clear
echo -e "${GREEN}"
cat << 'EOF'
         .---.
        /     \
       | ^   ^ |
        \  -  /
         |||||
EOF
echo -e "\n   [ FULL ROOT ACCESS GRANTED ]"
echo -e "${NC}"

# Kurzor visszaállítása
tput cnorm
