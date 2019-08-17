mkdir /tmp/spigot
cp server.jar /tmp/spigot
cd /tmp/spigot
wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
java -Xms1G -Xmx1G -jar BuildTools.jar --rev 1.14.4
mv /tmp/spigot/spigot-1.14.4.jar /usr/local/Minecraft_Server/spigot-server.jar
rm -rf /tmp/spigot
