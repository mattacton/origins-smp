FROM openjdk:11 AS stage
WORKDIR /minecraft/staging
COPY build/server server

WORKDIR /minecraft/staging/server
EXPOSE 25565
ENTRYPOINT java -Xms1G -Xmx3G -jar fabric-server-launch.jar nogui
