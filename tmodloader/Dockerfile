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
# 3) Install tModLoader server
#    tModLoader App ID is 1281930
# -------------------------------
RUN mkdir -p /tmodloader
WORKDIR /tmodloader

RUN steamcmd +login anonymous \
    +force_install_dir /tmodloader \
    +app_update 1281930 validate \
    +quit

# -------------------------------
# 4) Copy in a default server config if you have one
# -------------------------------
COPY serverconfig.txt /tmodloader/serverconfig.txt

# -------------------------------
# 5) Expose port and set entrypoint
#    We'll run on 7778 to avoid conflict with TShock's 7777
# -------------------------------
EXPOSE 7778

ENTRYPOINT [ \
  "./start-tModLoaderServer.sh", \
  "-config", "serverconfig.txt", \
  "-port", "7778", \
  "-maxplayers", "100", \
  "-worldpath", "/tmodloader/worlds" \
]
