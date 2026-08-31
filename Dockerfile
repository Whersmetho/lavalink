# Etapa 1: descargar el plugin LavaSrc durante el build (con red del build server de Railway)
FROM curlimages/curl:8.8.0 AS downloader
RUN curl -L -o /tmp/lavasrc-plugin-4.2.0.jar \
    https://maven.topi314.dev/releases/com/github/topi314/lavasrc/lavasrc-plugin/4.2.0/lavasrc-plugin-4.2.0.jar

# Etapa 2: imagen final de Lavalink con el plugin ya incluido
FROM ghcr.io/lavalink-devs/lavalink:4

# Colocamos el jar directo en la carpeta de plugins para que Lavalink NO tenga que descargarlo al arrancar
COPY --from=downloader /tmp/lavasrc-plugin-4.2.0.jar /opt/Lavalink/plugins/lavasrc-plugin-4.2.0.jar
COPY application.yml /opt/Lavalink/application.yml
