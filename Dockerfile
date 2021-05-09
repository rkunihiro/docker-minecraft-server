FROM openjdk:11-jre-stretch

ARG VERSION
ARG BUILD

# Install dependencies
RUN apt-get update -y \
    && apt-get install git -y

# Install mcrcon
RUN mkdir /tmp/mcrcon \
    && wget -O  /tmp/mcrcon/mcrcon.tar.gz https://github.com/Tiiffi/mcrcon/releases/download/v0.7.1/mcrcon-0.7.1-linux-x86-64.tar.gz \
    && tar xvzf /tmp/mcrcon/mcrcon.tar.gz -C /tmp/mcrcon \
    && ls /tmp/mcrcon/mcrcon-0.7.1-linux-x86-64 \
    && mv /tmp/mcrcon/mcrcon-0.7.1-linux-x86-64/mcrcon /usr/local/bin

# Download peper
RUN mkdir /usr/local/paper \
    && wget -O /usr/local/paper/paper.jar https://papermc.io/api/v1/paper/$VERSION/$BUILD/download \
    && ls -lha /usr/local/paper

WORKDIR /usr/local/Minecraft_Server

CMD ["java", "-Xms1G", "-Xmx1G", "-jar", "/usr/local/paper/paper.jar", "nogui"]
