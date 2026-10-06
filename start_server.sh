#!/bin/bash

echo "=========================================="
echo "   INICIANDO SERVIDOR HTTP"
echo "=========================================="
echo ""

if ! command -v python3 &> /dev/null; then
    echo "❌ Error: Python3 no está instalado"
    exit 1
fi

if ! command -v gh &> /dev/null; then
    echo "❌ Error: GitHub CLI (gh) no está instalado"
    exit 1
fi

echo "✓ Python3 detectado"
echo "✓ GitHub CLI detectado"
echo ""

echo "📍 Información del Codespace:"
echo "   Nombre: $CODESPACE_NAME"
echo "   Dominio: $GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN"
echo ""

echo "🚀 Iniciando servidor en puerto 8000..."
python3 server.py &
SERVER_PID=$!

sleep 2

if ! kill -0 $SERVER_PID 2>/dev/null; then
    echo "❌ Error: El servidor no se pudo iniciar"
    exit 1
fi

echo ""
echo "🌐 Haciendo el puerto público..."
gh codespace ports visibility 8000:public

echo ""
echo "=========================================="
echo "   SERVIDOR LISTO"
echo "=========================================="
echo ""
echo "📱 URL Pública:"
echo "   https://${CODESPACE_NAME}-8000.${GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN}"
echo ""
echo "🧪 Prueba local:"
echo "   curl http://localhost:8000/"
echo ""
wait $SERVER_PID
