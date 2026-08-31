# Lavalink para Railway (bot LEGADO MUSIC)

Este repo despliega un nodo Lavalink 4 con el plugin LavaSrc (soporte de Spotify)
YA INCLUIDO dentro de la imagen Docker (no se descarga en tiempo de ejecución,
evitando el error "UnknownHostException: maven.topi314.dev" que ocurre a veces
en el arranque de contenedores en Railway).

## Antes de subir a GitHub

Abre `application.yml` y reemplaza:
- `PON_AQUI_TU_SPOTIFY_CLIENT_ID` y `PON_AQUI_TU_SPOTIFY_CLIENT_SECRET`
  (los sacas de https://developer.spotify.com/dashboard)
- `PON_AQUI_UN_PASSWORD_SEGURO` por un password inventado por ti (largo, random).
  Este mismo valor va luego en la variable `LAVALINK_PASSWORD` del bot.

## Desplegar en Railway (reemplazando el servicio actual de "Docker Image")

1. Sube esta carpeta como un repo nuevo en GitHub.
2. En tu servicio Lavalink actual en Railway: ve a Settings -> Source,
   y cambia la fuente de "Docker Image" a "GitHub Repo", seleccionando este repo.
   (O si prefieres, borra el servicio actual y crea uno nuevo con "Deploy from GitHub repo".)
3. Si tenías variables de entorno puestas manualmente (SERVER_PORT, LAVALINK_SERVER_PASSWORD, etc.),
   puedes borrarlas todas — ya no son necesarias porque la configuración ahora vive en application.yml
   dentro de la imagen.
4. Espera el build (tardará un poco más porque descarga el plugin durante el build, no en el arranque).
5. Settings -> Networking -> "Generate Domain". Copia el dominio (ej: xxxx.up.railway.app).
6. En el servicio del BOT, configura:
   - LAVALINK_HOST = xxxx.up.railway.app   (sin https://)
   - LAVALINK_PORT = 443
   - LAVALINK_PASSWORD = el mismo password que pusiste en application.yml
   - LAVALINK_SECURE = true

## Verificar que funciona

En los logs del servicio Lavalink deberías ver que arranca sin errores,
sin el mensaje "Downloading ... lavasrc-plugin" (porque ya está incluido)
y sin "UnknownHostException".

En los logs del bot deberías ver:
  🟢 Nodo Lavalink listo: xxxx.up.railway.app:443
