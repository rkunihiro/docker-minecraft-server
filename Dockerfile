FROM openjdk:17-jdk-slim

ARG VERSION
ARG BUILD
ARG MCRCON

# Install dependencies
RUN apt-get update -y \
 && apt-get install git wget -y

# Install mcrcon
RUN mkdir /tmp/mcrcon \
 && wget -O  /tmp/mcrcon/mcrcon.tar.gz https://github.com/Tiiffi/mcrcon/releases/download/v${MCRCON}/mcrcon-${MCRCON}-linux-x86-64.tar.gz \
 && tar xvzf /tmp/mcrcon/mcrcon.tar.gz -C /tmp/mcrcon \
 && ls -1 /tmp/mcrcon \
 && mv /tmp/mcrcon/mcrcon /usr/local/bin

# Download peper
RUN mkdir /usr/local/paper \
 && wget -O /usr/local/paper/paper.jar https://papermc.io/api/v2/projects/paper/versions/${VERSION}/builds/${BUILD}/downloads/paper-${VERSION}-${BUILD}.jar \
 && ls -lha /usr/local/paper

WORKDIR /usr/local/Minecraft_Server

CMD ["java", "-Xms1G", "-Xmx1G", "-jar", "/usr/local/paper/paper.jar", "nogui"]
