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
        procps \
        lsof \
        xz-utils \
        mono-complete \
    && rm -rf /var/lib/apt/lists/*

# -------------------------------
# 2) Install .NET Runtime
# -------------------------------
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        apt-transport-https \
        gnupg \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /etc/apt/trusted.gpg.d/microsoft.gpg && \
    echo "deb [arch=amd64] https://packages.microsoft.com/debian/11/prod bullseye main" > /etc/apt/sources.list.d/microsoft.list

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        dotnet-runtime-8.0 \
    && rm -rf /var/lib/apt/lists/*

# -------------------------------
# 3) Install tModLoader directly from GitHub
# -------------------------------
RUN mkdir -p /tmodloader
WORKDIR /tmodloader

# Download latest tModLoader stable release 
RUN wget -O tmodloader.zip "https://github.com/tModLoader/tModLoader/releases/latest/download/tModLoader.zip" && \
    unzip tmodloader.zip && \
    rm tmodloader.zip && \
    chmod +x start-tModLoaderServer.sh || echo "No direct executables found, will search during runtime"

# Create necessary directories
RUN mkdir -p /tmodloader/worlds /tmodloader/ModLoader/Mods

# -------------------------------
# 4) Copy in a default server config
# -------------------------------
COPY serverconfig.txt /tmodloader/serverconfig.txt

# -------------------------------
# 5) Copy and prepare the server script
# -------------------------------
COPY run-server.sh /tmodloader/run-server.sh
RUN chmod +x /tmodloader/run-server.sh

# -------------------------------
# 6) Expose port and set entrypoint
# -------------------------------
EXPOSE 7780

ENTRYPOINT ["/tmodloader/run-server.sh"]
