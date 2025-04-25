FROM debian:11-slim

# -------------------------------
# 1) Install dependencies & .NET 6 Runtime
# -------------------------------
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        wget \
        curl \
        lib32gcc-s1 \
        unzip \
        # Install .NET prerequisites
        libc6 \
        libgcc1 \
        libgcc-s1 \
        libgssapi-krb5-2 \
        libicu67 \
        libssl1.1 \
        libstdc++6 \
        zlib1g && \
    # Download and install .NET 6 Runtime
    wget https://packages.microsoft.com/config/debian/11/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
    rm packages-microsoft-prod.deb && \
    apt-get update && \
    apt-get install -y --no-install-recommends dotnet-runtime-6.0 \
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

RUN /steamcmd/steamcmd.sh +login anonymous \
    +force_install_dir /terraria \
    +app_update 105600 validate \
    +quit

# -------------------------------
# 4) Install TShock for Terraria 1.4.4.x
#    Check https://github.com/Pryaxis/TShock/releases for latest releases.
# -------------------------------
RUN wget https://github.com/Pryaxis/TShock/releases/download/v5.2.3/TShock-5.2.3-for-Terraria-1.4.4.9-linux-amd64-Release.zip -O tshock.zip \
    && unzip tshock.zip -d /terraria \
    && tar -xvf /terraria/TShock-Beta-linux-x64-Release.tar -C /terraria \
    && rm tshock.zip /terraria/TShock-Beta-linux-x64-Release.tar

# -------------------------------
# 5) Prepare world directory and copy config
# -------------------------------
RUN mkdir -p /terraria/worlds /terraria/tshock
COPY serverconfig.txt /terraria/serverconfig.txt
COPY config/config.json /terraria/tshock/config.json

# -------------------------------
# 6) Expose port and set entrypoint
# -------------------------------
EXPOSE 7777
# Expose REST API port
EXPOSE 7878

# We set up an ENTRYPOINT that runs the TShock server with desired arguments.
# -maxplayers 100 sets the max at 100. Adjust as needed.
# -configpath sets where TShock should look for its configuration files
ENTRYPOINT [ \
  "./TShock.Server", \
  "-config", "serverconfig.txt", \
  "-port", "7777", \
  "-maxplayers", "100", \
  "-worldpath", "/terraria/worlds", \
  "-autocreate", "1" \
]
