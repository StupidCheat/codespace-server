# Servidor HTTP Accesible desde Internet en GitHub Codespace

Servidor HTTP que se inicia automáticamente cuando entras al Codespace. El puerto 8000 se configura automáticamente como público y recibes la URL completa para acceder desde internet.

## Inicio automático

Al abrir el Codespace:
1. El servidor se inicia automáticamente
2. El puerto 8000 se hace público
3. Recibes la URL pública en el terminal

## Manual: Iniciar con comando

```bash
bash start_server.sh
```

O directamente:

```bash
python server.py
```

## URLs

### Local
```
http://localhost:8000
```

### Pública
```
https://${CODESPACE_NAME}-8000.${GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN}
```

## Pruebas

### Local
```bash
curl http://localhost:8000/
```

### Desde otro dispositivo
```bash
curl https://${CODESPACE_NAME}-8000.${GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN}/
```

Respuesta esperada:
```
Servidor funcionando
```

## Archivos

- `server.py` - Servidor HTTP Python
- `start_server.sh` - Arranca el servidor, hace público el puerto 8000 y muestra URL
- `.devcontainer/devcontainer.json` - Configuración del port forwarding
- `README.md` - Documentación del proyecto
- `init.sh` - Script de inicio del Codespace
