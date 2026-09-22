#!/bin/bash

echo "Iniciando instalación automatizada del Watchdog"

# 1. Copiar el script y dar permisos de ejecución
echo "Copiando el script en /usr/local/bin/..."
sudo cp watchdog-ping.sh /usr/local/bin/watchdog-ping.sh
sudo chmod +x /usr/local/bin/watchdog-ping.sh

# 2. Copiar el servicio a las carpetas del sistema
echo "Creando el servicio en Systemd..."
sudo cp watchdog-ping.service /etc/systemd/system/watchdog-ping.service

# 3. Recargar, habilitar e iniciar el daemon
echo "Habilitando el servicio"
sudo systemctl daemon-reload
sudo systemctl enable watchdog-ping.service
sudo systemctl start watchdog-ping.service

echo "¡Instalación completada con éxito!"
echo "Puedes revisar el estado con: sudo systemctl status watchdog-ping.service"
