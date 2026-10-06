# Servidor HTTP Accesible desde Internet en GitHub Codespace

Servidor HTTP sencillo ejecutándose en un GitHub Codespace, accesible desde cualquier dispositivo con internet.

## Requisitos

- GitHub Codespace activo
- Python 3.7+
- GitHub CLI (gh) preinstalado en el Codespace

## Inicio rápido

### 1. Iniciar el servidor

```bash
python server.py
```

### 2. Hacer el puerto público

```bash
gh codespace ports visibility 8000:public
```

### 3. Obtener la URL pública

```bash
echo "https://${CODESPACE_NAME}-8000.${GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN}"
```

## Pruebas

### Local

```bash
curl http://localhost:8000/
```

Respuesta esperada:

```text
Servidor funcionando
```

### Desde otro dispositivo

```bash
curl https://${CODESPACE_NAME}-8000.${GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN}/
```

## Estructura

```text
codespace-server/
├── server.py
├── start_server.sh
├── COMANDOS.md
├── README.md
├── .devcontainer/
│   └── devcontainer.json
├── .gitignore
└── .gitmodules
```

## Comandos útiles

```bash
python server.py
gh codespace ports visibility 8000:public
echo "https://${CODESPACE_NAME}-8000.${GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN}"
```
