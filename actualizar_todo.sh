#!/bin/bash

echo "🔄 Iniciando actualización de contenedores en /home/docker"
echo "Fecha: $(date '+%Y-%m-%d %H:%M:%S')"
echo "==============================================="

BASE_DIR="/home/docker"
CARPETAS=("$BASE_DIR"/*/)
TOTAL=${#CARPETAS[@]}
ACTUAL=0

mostrar_barra() {
  local progreso=$1
  local total=$2
  local porcentaje=$(( 100 * progreso / total ))
  local barras=$(( porcentaje / 5 ))
  local espacios=$(( 20 - barras ))

  local barra=""
  for ((i=0; i<barras; i++)); do barra+="#"; done
  for ((i=0; i<espacios; i++)); do barra+=" "; done

  echo "⏳ Progreso: [$barra] $porcentaje%"
}

for dir in "${CARPETAS[@]}"; do
  if [[ -f "$dir/docker-compose.yml" ]]; then
    ((ACTUAL++))
    echo -e "\n📁 Actualizando: $dir"
    mostrar_barra $ACTUAL $TOTAL
    echo "---------------------------------------"

    cd "$dir"
    docker compose down
    docker compose pull
    docker compose up -d

    echo "✅ Finalizado: $dir"
    echo "---------------------------------------"
  fi
done

echo -e "\n🎉 Actualización completa de todos los contenedores."
