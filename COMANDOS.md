# Comandos rápidos

## Iniciar el servidor

```bash
python server.py
```

## Hacer público el puerto 8000

```bash
gh codespace ports visibility 8000:public
```

## Obtener la URL final

```bash
echo "https://${CODESPACE_NAME}-8000.${GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN}"
```

## Probar localmente

```bash
curl http://localhost:8000/
```

## Probar desde otro dispositivo

```bash
curl https://${CODESPACE_NAME}-8000.${GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN}/
```
