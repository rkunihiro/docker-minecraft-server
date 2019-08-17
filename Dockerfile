FROM openjdk:8-jre-stretch

# Install dependencies
RUN apt-get update -y \
 && apt-get install git -y

# Install mcrcon
RUN mkdir /tmp/mcrcon \
 && wget -O  /tmp/mcrcon/mcrcon.tar.gz https://github.com/Tiiffi/mcrcon/releases/download/v0.0.5/mcrcon-0.0.5-linux-x86-64.tar.gz \
 && tar xvzf /tmp/mcrcon/mcrcon.tar.gz -C /tmp/mcrcon \
 && mv /tmp/mcrcon/mcrcon /usr/local/bin

WORKDIR /usr/local/Minecraft_Server
