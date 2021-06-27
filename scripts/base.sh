#! /bin/zsh
# Make sure we have the proper folders
mkdir -p build/server

# Fabric installer and server.jar download
curl https://maven.fabricmc.net/net/fabricmc/fabric-installer/0.7.4/fabric-installer-0.7.4.jar -o build/fabric-installer-0.7.4.jar
java -jar build/fabric-installer-0.7.4.jar server -dir build/server -mcversion 1.16.5 -downloadMinecraft -noprofile

# First run, expected to fail
pushd build/server
java -jar fabric-server-launch.jar nogui
popd

# Copy Configs
cp server-config/* build/server

# Copy Mods
cp -R ../origins-artifacts/mods/* build/server/mods
cp -R ../origins-artifacts/config/* build/server/config

cd build/server

# zip server.zip -r ./* ./.*

#java -Xms1G -Xmx3G -jar fabric-server-launch.jar nogui