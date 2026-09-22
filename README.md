# Network & WireGuard VPN Boot-Sequence Watchdog

Script en Bash y servicio de **Systemd** diseñados para verificar la conectividad a Internet en el arranque del sistema antes de inicializar la interfaz VPN de WireGuard (`wg0`).

# ¿Qué hace este proyecto?
1. **Validación de Red:** Al iniciar el sistema, el script ejecuta un bucle (`while true`) que realiza pings cada 5 segundos hacia servidores DNS públicos (`8.8.8.8` / `8.8.4.4`).
2. **Activación de VPN:** En cuanto detecta conectividad real a Internet, ejecuta el comando `/usr/bin/wg-quick up wg0`.
3. **Cierre de Ejecución:** Una vez levantada la interfaz, el script rompe el ciclo (`break`) y finaliza de forma limpia liberando los recursos del sistema.

---

# Archivos
* `watchdog-ping.sh`: Script de control en Bash.
* `watchdog-ping.service`: Configuración de servicio nativo de Systemd tipo `oneshot`.

---

# Instalación
Cada vez que configures una nueva procesadora, clona este repositorio, entra a la carpeta y ejecuta el instalador automatizado:

```bash
chmod +x install.sh
./install.sh

# Verificar estado del servicio
```bash
sudo systemctl status watchdog-ping.service
```
