#!/bin/bash

echo "🔄 Iniciando actualización general de contenedores en /home/docker"
echo "Fecha: $(date '+%Y-%m-%d %H:%M:%S')"
echo "==============================================="

BASE_DIR="/home/docker"
RESULTADOS=""

for dir in "$BASE_DIR"/*/; do
  if [[ -f "$dir/docker-compose.yml" ]]; then
    RESULTADOS+="\n📁 Actualizando: $dir\n"
    
    cd "$dir"
    SALIDA_DOWN=$(docker compose down 2>&1)
    SALIDA_PULL=$(docker compose pull 2>&1)
    SALIDA_UP=$(docker compose up -d 2>&1)
    
    RESULTADOS+="$SALIDA_DOWN\n$SALIDA_PULL\n$SALIDA_UP\n"
    RESULTADOS+="✅ Finalizado: $dir\n"
    RESULTADOS+="---------------------------------------\n"
  else
    RESULTADOS+="⚠️  No se encontró docker-compose.yml en $dir, saltando...\n"
  fi
done

echo -e "$RESULTADOS"
echo "🎉 Actualización completa de todos los contenedores."
