# actualizador-docker

Script para actualizar todos mis contenedores en `/home/docker`.

---

## 🔄 Paso 1: Ejecutar script

```bash
curl -O https://raw.githubusercontent.com/men2985/actualizador-docker/main/actualizar_todo.sh
chmod +x actualizar_todo.sh
sudo ./actualizar_todo.sh
```

---

## 🔧 Paso 2 (si muestra error 502)

```bash
docker network connect backend nginx-app-1
docker restart nginx-app-1
```

---

Ya debería estar todo funcionando en su última versión 🚀
