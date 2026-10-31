#!/bin/bash

echo "Iniciando instalación"

# 1. Copiar el script y dar permisos de ejecución
sudo cp watchdog-ping.sh /usr/local/bin/watchdog-ping.sh
sudo chmod +x /usr/local/bin/watchdog-ping.sh

# 2. Copiar el servicio a las carpetas del sistema
sudo cp watchdog-ping.service /etc/systemd/system/watchdog-ping.service

# 3. Habilitar e iniciar el servcio
sudo systemctl daemon-reload
sudo systemctl enable watchdog-ping.service
sudo systemctl start watchdog-ping.service

echo "¡Instalación completada con éxito!"
echo "Puedes revisar el estado con: sudo systemctl status watchdog-ping.service"
