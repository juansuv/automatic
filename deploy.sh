#!/bin/bash

# Script de despliegue manual seguro
# Uso: ./deploy.sh "mensaje de commit"

set -e  # Salir si hay errores

# Verificar que se proporcione un mensaje de commit
if [ -z "$1" ]; then
    echo "Error: Debes proporcionar un mensaje de commit"
    echo "Uso: ./deploy.sh 'tu mensaje de commit'"
    exit 1
fi

COMMIT_MESSAGE="$1"

echo "🔍 Verificando estado del repositorio..."
git status

echo ""
echo "📝 Revisando cambios..."
git diff --stat

echo ""
read -p "¿Continuar con el commit y push? (y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "❌ Operación cancelada"
    exit 1
fi

echo ""
echo "📦 Agregando archivos..."
git add .

echo "💾 Creando commit..."
git commit -m "$COMMIT_MESSAGE"

echo "📤 Subiendo a repositorio remoto..."
if git remote | grep -q origin; then
    git push origin main
    echo "✅ Despliegue completado exitosamente"
else
    echo "⚠️  No hay repositorio remoto configurado"
    echo "Para configurar un repositorio remoto:"
    echo "git remote add origin <URL_DEL_REPOSITORIO>"
    echo "git push -u origin main"
fi