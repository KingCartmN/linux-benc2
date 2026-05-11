#!/bin/bash

# Képernyő törlése
clear

echo "  CLEAN   .config"
sleep 1
echo "  HOSTCC  scripts/basic/fixdep"
sleep 0.5
echo "  HOSTCC  scripts/kconfig/conf.o"
sleep 0.5
echo "  SHIPPED scripts/kconfig/zconf.tab.c"
sleep 0.5
echo "  HOSTLD  scripts/kconfig/conf"
sleep 1
echo "scripts/kconfig/conf  --syncconfig Kconfig"
sleep 1
echo "  SYSTBL  arch/x86/include/generated/asm/syscalls_64.h"
sleep 0.5
echo "  WRAP    arch/x86/include/generated/uapi/asm/bpf_perf_event.h"
sleep 1

# Kamu könyvtárak a valósághűségért
directories=("kernel" "mm" "fs" "net" "ipc" "security" "crypto" "block" "drivers/char" "drivers/usb" "drivers/net" "arch/x86/boot")

# Fő ciklus - 150 fájlt fog "lefordítani"
for i in {1..150}; do
    # Véletlenszerű könyvtár kiválasztása
    dir=${directories[$RANDOM % ${#directories[@]}]}
    file="module_${RANDOM}"

    # 90% eséllyel fájlt fordít (CC), 10% eséllyel linkel (LD)
    if [ $((RANDOM % 10)) -lt 9 ]; then
        echo "  CC      $dir/$file.o"
        # Nagyon gyors, véletlenszerű késleltetés (0.01 - 0.1 másodperc)
        sleep 0.0$((RANDOM % 9 + 1))
    else
        echo "  LD      $dir/built-in.a"
        sleep 0.$((RANDOM % 5 + 2))
    fi

    # Véletlenszerű esemény: Ritkán bedob egy sárga "Warning" üzenetet
    if [ $((RANDOM % 40)) -eq 1 ]; then
        # Sárga szín bekapcsolása (\e[33m)
        echo -e "\e[33m$dir/$file.c: In function ‘init_module’:\e[0m"
        echo -e "\e[33m$dir/$file.c:42:5: warning: implicit declaration of function ‘kmalloc’ [-Wimplicit-function-declaration]\e[0m"
        sleep 1
    fi
done

# Befejező folyamatok szimulálása
echo "  AR      built-in.a"
sleep 1
echo "  LD      vmlinux.o"
sleep 2
echo "  MODPOST vmlinux.o"
sleep 1
echo "  LD      vmlinux"
sleep 2
echo "  SORTEX  vmlinux"
sleep 1
echo "  SYSMAP  System.map"
sleep 1
echo "  OBJCOPY arch/x86/boot/compressed/vmlinux.bin"
sleep 1
echo "  BUILD   arch/x86/boot/bzImage"
sleep 2

# Összegzés kiírása
echo "Setup is 17056 bytes (padded to 17408 bytes)."
echo "System is 8192 kB"
echo "CRC 83a0b4e2"
echo ""
# Zöld színnel (\e[32m) kiírja a sikert
echo -e "\e[32mKernel: arch/x86/boot/bzImage is ready  (#1)\e[0m"
echo ""
