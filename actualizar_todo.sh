#!/bin/bash

echo "🔄 Iniciando actualización de contenedores en /home/docker"
echo "Fecha: $(date '+%Y-%m-%d %H:%M:%S')"
echo "==============================================="

BASE_DIR="/home/docker"
CARPETAS=("$BASE_DIR"/*/)
TOTAL=${#CARPETAS[@]}
ACTUAL=0

# Función para mostrar barra de progreso
mostrar_barra() {
  local progreso=$1
  local total=$2
  local porcentaje=$(( 100 * progreso / total ))
  local barras=$(( porcentaje / 5 ))  # Cada barra representa 5%
  local espacios=$(( 20 - barras ))

  echo -ne "\r⏳ Progreso: ["
  printf '%0.s#' $(seq 1 $barras)
  printf '%0.s ' $(seq 1 $espacios)
  echo -n "] $porcentaje%"
}

for dir in "${CARPETAS[@]}"; do
  if [[ -f "$dir/docker-compose.yml" ]]; then
    ((ACTUAL++))
    echo -e "\n📁 Actualizando: $dir"
    mostrar_barra $ACTUAL $TOTAL

    cd "$dir"
    docker compose down
    docker compose pull
    docker compose up -d

    echo -e "\n✅ Finalizado: $dir"
    echo "---------------------------------------"
  fi
done

echo -e "\n🎉 Actualización completa de todos los contenedores."
