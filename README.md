# 🕹️ Counter-Strike: Source Server en Docker 🐳

¡Bienvenido!  
Este proyecto te permite levantar tu propio servidor dedicado de **Counter-Strike: Source** (CS:S) usando Docker, de manera fácil y segura.  
Ideal para jugar con amigos, practicar, o crear tu propia comunidad gaming.  

---

## 🚀 Características

- **Instalación automática** de CS:S con SteamCMD.
- **Dockerizado**: Sin líos de dependencias en tu máquina.
- **Actualizaciones automáticas**: Siempre el último build del juego.
- **Listo para mods**: Puedes agregar Sourcemod, Metamod y plugins fácilmente.
- **Compatible con Playit.gg**: ¡Tu server accesible desde cualquier lugar!
- **Ejemplo de configuración** y puerto.


## 📦 ¿Qué incluye este repo?

- `Dockerfile`: Imagen lista para compilar y correr CS:S.
- `entrypoint.sh`: Script de arranque y actualización automática.
- `docker-compose.yml`: Levanta tu server con un comando.
- `doc.md`: Explica cómo se armó todo y cómo exponerlo con Playit.gg.


## 🏁 Rápido inicio

1. **Clona este repo:**
   ```sh
   git clone https://github.com/n1krov/css_server.git
   cd css_server
   ```

2. **Construye y levanta el server:**
   ```sh
   docker compose up --build
   ```
`--build` es solo la primera vez, luego para levantarlo y apagarlo respectivamente

Para **prenderlo**
```sh
docker compose up -d
```

Para **apagarlo**
```sh
docker compose down
```

3. **Configura tu Playit.gg** para exponer el puerto 27015 (TCP y UDP).

4. **Conéctate desde CS:S:**  
   Usa la IP y puerto que te asigne Playit.gg.


## 🎮 ¿Dónde está mi configuración?

- El servidor se instala en `./css_ds` (puedes editar tu `server.cfg` en `css_ds/cstrike/cfg/server.cfg`).
- Puedes agregar mapas, mods y plugins en las carpetas correspondientes.

---

## 🤝 ¡Contribuye!

¿Quieres agregar mejoras, mods preinstalados o guías?  
¡Abre un PR o issue!

## 📜 Licencia

MIT. Haz lo que quieras… ¡pero comparte las mejoras!

---

Hecho con ❤️ por [n1krov](https://github.com/n1krov)
