FROM debian:11-slim

# -------------------------------
# 1) Install dependencies
# -------------------------------
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        wget \
        curl \
        lib32gcc-s1 \
        unzip \
    && rm -rf /var/lib/apt/lists/*

# -------------------------------
# 2) Install SteamCMD
# -------------------------------
RUN mkdir /steamcmd && \
    cd /steamcmd && \
    wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz && \
    tar -xvzf steamcmd_linux.tar.gz && \
    rm steamcmd_linux.tar.gz

ENV STEAMCMD_DIR="/steamcmd"
ENV PATH="$STEAMCMD_DIR:$PATH"

# -------------------------------
# 3) Install vanilla Terraria server (so TShock has the correct files)
#    Terraria App ID is 105600
# -------------------------------
RUN mkdir -p /terraria
WORKDIR /terraria

RUN steamcmd +login anonymous \
    +force_install_dir /terraria \
    +app_update 105600 validate \
    +quit

# -------------------------------
# 4) Install TShock for Terraria 1.4.4.x
#    Check https://github.com/Pryaxis/TShock/releases for latest releases.
# -------------------------------
RUN wget https://github.com/Pryaxis/TShock/releases/download/v4.5.16/TShock_4.5.16_Terraria_1.4.4.9.zip -O tshock.zip \
    && unzip tshock.zip -d /terraria \
    && rm tshock.zip

# -------------------------------
# 5) Copy in a default server config if you have one
# -------------------------------
COPY serverconfig.txt /terraria/serverconfig.txt

# -------------------------------
# 6) Expose port and set entrypoint
# -------------------------------
EXPOSE 7777

# We set up an ENTRYPOINT that runs the TShock server with desired arguments.
# -maxplayers 100 sets the max at 100. Adjust as needed.
# TShock uses the same server binary name as the vanilla server but patched.
ENTRYPOINT [ \
  "./TerrariaServer.bin.x86_64", \
  "-config", "serverconfig.txt", \
  "-port", "7777", \
  "-maxplayers", "100", \
  "-worldpath", "/terraria/worlds" \
]
