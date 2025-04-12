actualizador-docker
===================

Script para actualizar todos mis contenedores en /home/docker

Copia y pega:

```bash
curl -O https://raw.githubusercontent.com/men2985/actualizador-docker/main/actualizar_todo.sh
chmod +x actualizar_todo.sh
sudo ./actualizar_todo.sh

Despues:

```bash
docker network connect backend nginx-app-1
docker restart nginx-app-1
