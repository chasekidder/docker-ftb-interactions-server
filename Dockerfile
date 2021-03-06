FROM openjdk:8-jre

MAINTAINER Chase Kidder <https://github.com/chasekidder>

# Update container
RUN apt-get update && \
	apt-get install apt-utils --yes && \
	apt-get upgrade --yes --allow-remove-essential && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

# Set workdir
WORKDIR /minecraft

# Change user to root
USER root

# Creating user and downloading files
RUN useradd -m -U minecraft && \
	mkdir -p /minecraft/world 

# Install FTB
ADD ./serverinstall_5_121 serverinstall_5_121
RUN chmod +x serverinstall_5_121 && yes | ./serverinstall_5_121 && \
    chmod u+x start.sh && \
	echo "#By changing the setting below to TRUE you are indicating your agreement to our EULA (https://account.mojang.com/documents/minecraft_eula)." > eula.txt && \
	echo "$(date)" >> eula.txt && \
	echo "eula=TRUE" >> eula.txt && \
	chown -R minecraft:minecraft /minecraft
USER minecraft

# Expose port 25565
EXPOSE 25565

# Start server
CMD ["/bin/bash", "/minecraft/start.sh"]

