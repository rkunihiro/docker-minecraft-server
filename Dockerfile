FROM openjdk:8-jre-stretch

# Install dependencies
RUN apt-get update -y \
 && apt-get install git -y

# Install mcrcon
RUN mkdir /tmp/mcrcon \
 && wget -O  /tmp/mcrcon/mcrcon.tar.gz https://github.com/Tiiffi/mcrcon/releases/download/v0.0.5/mcrcon-0.0.5-linux-x86-64.tar.gz \
 && tar xvzf /tmp/mcrcon/mcrcon.tar.gz -C /tmp/mcrcon \
 && mv /tmp/mcrcon/mcrcon /usr/local/bin

# Install spigot
RUN mkdir /usr/local/spigot && cd /usr/local/spigot \
 && wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar \
 && java -Xms1G -Xmx1G -jar BuildTools.jar --rev 1.14.4

WORKDIR /usr/local/Minecraft_Server

CMD ["java", "-Xms1G", "-Xmx1G", "-jar", "/usr/local/spigot/spigot-1.14.4.jar", "nogui"]
