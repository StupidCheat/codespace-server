#!/bin/bash

# Script de inicio automático del Codespace
# Este script se ejecuta cuando el Codespace se inicia

echo "🚀 Inicializando Codespace..."

# Dar permisos al script start_server.sh
chmod +x /workspaces/codespace-server/start_server.sh

# Iniciar el servidor automáticamente
/workspaces/codespace-server/start_server.sh
