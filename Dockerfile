FROM fredboat/lavalink:dev

COPY application.yml /opt/Lavalink/application.yml

EXPOSE 7860

CMD ["java", "-Xmx512m", "-jar", "/opt/Lavalink/Lavalink.jar"]
