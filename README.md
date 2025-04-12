# actualizador-docker
Script para actualizar todos mis contenedores en /home/docker

Copia y pega:

curl -O https://raw.githubusercontent.com/men2985/actualizador-docker/main/actualizar_todo.sh
chmod +x actualizar_todo.sh
sudo ./actualizar_todo.sh


despues:

docker network connect backend nginx-app-1
docker restart nginx-app-1

Ya deberia estar todo funcionado en su ultima vercion


