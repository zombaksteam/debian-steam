FROM debian:latest
MAINTAINER zombaksteam <zombaksteam@gmail.com>

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update && \
	apt-get -y upgrade && \
	apt-get install -y zip && \
	apt-get install -y gdb && \
	apt-get install -y wget && \
	apt-get install -y lib32gcc1 && \
	apt-get install -y libc6-dev && \
	apt-get install -y libgdiplus && \
	apt-get install -y libmonoboehm-2.0-1 && \
	apt-get install -y sqlite3 sqlite3-doc && \
	useradd -m steam && \
	echo "" >> /home/steam/.profile && \
	echo "TIME_ZONE=\$(cat /etc/timezone)" >> /home/steam/.profile && \
	echo "export TZ=\"\${TIME_ZONE}\"" >> /home/steam/.profile && \
	echo "" >> /home/steam/.bashrc && \
	echo "TIME_ZONE=\$(cat /etc/timezone)" >> /home/steam/.bashrc && \
	echo "export TZ=\"\${TIME_ZONE}\"" >> /home/steam/.bashrc && \
	su - steam -c "mkdir /home/steam/steamcmd" && \
	su - steam -c "cd /home/steam/steamcmd;wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" && \
	su - steam -c "cd /home/steam/steamcmd;tar -xvzf steamcmd_linux.tar.gz;rm steamcmd_linux.tar.gz" && \
	su - steam -c "cd /home/steam/steamcmd;./steamcmd.sh +quit" && \
	su - steam -c "mkdir /home/steam/.steam/sdk32" && \
	su - steam -c "ln -s /home/steam/steamcmd/linux32/steamclient.so /home/steam/.steam/sdk32/steamclient.so"
