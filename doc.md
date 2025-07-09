# 🛠️ Montaje y Funcionamiento del Servidor CS:S en Docker + Playit.gg

Este documento explica **cómo funciona el proyecto**, cómo lo armé y cómo puedes levantar tu propio servidor de Counter-Strike: Source (CS:S) — incluso si no tienes una IP pública, gracias a Playit.gg.


## 📑 Índice

- [¿Cómo funciona?](#cómo-funciona)
- [¿Qué hay en cada archivo?](#qué-hay-en-cada-archivo)
- [Pasos para montar el server](#pasos-para-montar-el-server)
- [Exponerlo al mundo con Playit.gg](#exponerlo-al-mundo-con-playitgg)
- [Notas y recomendaciones](#notas-y-recomendaciones)

---

## ¿Cómo funciona?

El proyecto usa **Docker** para crear un entorno limpio y reproducible donde SteamCMD instala y actualiza el servidor dedicado de CS:S automáticamente.  
Todo el proceso es headless y automatizado: solo necesitas tener Docker instalado.

- **SteamCMD** se descarga y ejecuta dentro del contenedor.
- El servidor se instala en `/opt/css_ds` y se expone a la máquina host.
- Usando **Playit.gg** puedes abrir el server a Internet, aunque tengas NAT, CGNAT, o no tengas IP pública.


## ¿Qué hay en cada archivo?

- **Dockerfile**:  
  Define una imagen basada en Debian, instala dependencias de 32 bits, descarga SteamCMD, y deja todo listo para correr el server.

- **entrypoint.sh**:  
  Script que ejecuta SteamCMD para instalar/actualizar CS:S y luego arranca el servidor con los parámetros deseados.

- **docker-compose.yml**:  
  Orquesta el contenedor, mapea los puertos (27015 UDP/TCP y 27020 UDP por defecto), y expone el volumen para datos persistentes.

- **README.md**:  
  La bienvenida, guía rápida y todo lo esencial para el usuario final.

- **montaje_y_funcionamiento.md** (este archivo):  
  La explicación detallada de cómo funciona y cómo lo armé.


## Pasos para montar el server

1. **Instala Docker y Docker Compose** en tu sistema operativo.
2. **Clona este repositorio** y entra al directorio:
   ```sh
   git clone https://github.com/tuusuario/tu-repo-css-server.git
   cd tu-repo-css-server
   ```
3. **Lanza el servidor:**
   ```sh
   docker compose up --build
   ```
   La primera vez descargará todo el server. Los siguientes arranques serán más rápidos.

4. **(Opcional) Edita la configuración:**
   - El server se instala en la carpeta `css_ds`.
   - Puedes editar `css_ds/cstrike/cfg/server.cfg` para personalizar el nombre del server, contraseñas, admins, etc.

---

## Exponerlo al mundo con Playit.gg

### ¿Por qué Playit.gg?

- Permite exponer servicios (como servidores de juegos) a Internet **sin abrir puertos en el router** y sin IP pública.
- Funciona detrás de NAT o CGNAT.

### ¿Cómo lo configuré?

1. **Me registré en [playit.gg](https://playit.gg) y descargué el cliente.**
2. **Creé un túnel TCP+UDP**:
   - Protocolo: **TCP+UDP**
   - Puerto local: **27015** (el mismo que el server)
   - Puerto público: El que te asigne Playit.gg (ejemplo: 12345)
   - Región: Global Anycast (free)

3. **Arranqué el cliente de Playit.gg** en la misma máquina donde corre Docker:
   ```sh
   ./playit-linux
   ```
   (Sigue las instrucciones de la web de Playit.gg para el cliente de tu sistema.)

4. **Compartí la IP y puerto público que me asignó Playit.gg**.  
   Ejemplo: `cs.example.playit.gg:12345` o `XXX.XXX.XXX.XXX:12345`

### ¿Qué deben hacer tus amigos?

- Entrar a Counter-Strike: Source y conectarse a esa IP:puerto (por consola: `connect IP:PUERTO`).


## Notas y recomendaciones

- **No ejecutes el server como root** para producción (puedes crear un usuario en el Dockerfile para mayor seguridad).
- **Siempre usa TCP+UDP** al crear el túnel en Playit.gg.
- **Puedes instalar mods** (Sourcemod, Metamod) poniendo los archivos en la carpeta correspondiente dentro de `css_ds`.
- **Haz backups** periódicos de la carpeta `css_ds` si personalizas mapas o configs.


¡Listo!  
Ahora sabes exactamente cómo funciona y cómo levantar y compartir tu server dedicado de CS:S en cualquier parte del mundo 🚀

---

Hecho con 💙 por [n1krov](https://github.com/n1krov)

