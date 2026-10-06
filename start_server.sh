#!/bin/bash

# Script para iniciar el servidor, hacerlo público y mostrar la URL

echo "==========================================="
echo "   INICIANDO SERVIDOR HTTP CODESPACE"
echo "==========================================="
echo ""

# Verificar Python3
if ! command -v python3 &> /dev/null; then
    echo "❌ Error: Python3 no está instalado"
    exit 1
fi

# Verificar GitHub CLI
if ! command -v gh &> /dev/null; then
    echo "❌ Error: GitHub CLI (gh) no está instalado"
    exit 1
fi

echo "✅ Dependencias verificadas"
echo ""

# Iniciar servidor en background
echo "🚀 Iniciando servidor en puerto 8000..."
python3 server.py > server.log 2>&1 &
SERVER_PID=$!

# Esperar a que el servidor inicie
sleep 3

# Verificar que el servidor está corriendo
if ! kill -0 $SERVER_PID 2>/dev/null; then
    echo "❌ Error: El servidor no se pudo iniciar"
    cat server.log
    exit 1
fi

echo "✅ Servidor iniciado (PID: $SERVER_PID)"
echo ""

# Hacer puerto público
echo "🌐 Haciendo puerto 8000 público..."
gh codespace ports visibility 8000:public > /dev/null 2>&1

# Esperar a que se propague
sleep 2

echo "✅ Puerto 8000 configurado como público"
echo ""

# Mostrar información
echo "==========================================="
echo "   🎉 SERVIDOR LISTO Y ACTIVO"
echo "==========================================="
echo ""
echo "📍 Servidor Local:"
echo "   http://localhost:8000"
echo ""
echo "🌍 URL PÚBLICA (accesible desde internet):"
echo "   https://${CODESPACE_NAME}-8000.${GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN}"
echo ""
echo "📝 Comandos útiles:"
echo "   curl http://localhost:8000/"
echo "   curl https://${CODESPACE_NAME}-8000.${GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN}/"
echo ""
echo "⏹️  Para detener: Ctrl+C"
echo ""
echo "==========================================="

# Mantener el script activo
wait $SERVER_PID
