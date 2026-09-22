#!/bin/bash

# IPs a validar
PRIMARY_IP="8.8.8.8"
SECONDARY_IP="8.8.4.4"
WG_IF="wg0"

# Función levantar VPN
levantar_vpn() {
    if ip link show $WG_IF 2>/dev/null | grep -q "UP"; then
        echo "La VPN $WG_IF ya está levantada, bajando..."
        /usr/bin/sudo /usr/bin/wg-quick down $WG_IF
    fi
    echo "Levantando VPN $WG_IF..."
    /usr/bin/sudo /usr/bin/wg-quick up $WG_IF
}

# Bucle
echo "Esperando conectividad con $PRIMARY_IP o $SECONDARY_IP..."
while true; do
    if ping -c 1 -W 1 $PRIMARY_IP &>/dev/null; then
        echo "Conectividad detectada con $PRIMARY_IP"
        levantar_vpn
        break
    elif ping -c 1 -W 1 $SECONDARY_IP &>/dev/null; then
        echo "Conectividad detectada con $SECONDARY_IP"
        levantar_vpn
        break
    fi
    sleep 5
done
