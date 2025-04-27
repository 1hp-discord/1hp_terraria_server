#!/bin/bash

PLUGINS_DIR="./tshock/plugins"
mkdir -p "$PLUGINS_DIR"

# Function to download a file if it doesn't exist or is empty
download_plugin() {
    local url="$1"
    local output="$2"
    
    if [ ! -s "$output" ]; then
        echo "Downloading $output..."
        curl -L "$url" -o "$output"
        echo "Downloaded $output"
    else
        echo "$output already exists, skipping download"
    fi
}

# MultiSEngine (server linking)
download_plugin "https://github.com/Pryaxis/Plugins/raw/master/1.4.4/MultiSEngine/MultiSEngine.dll" "$PLUGINS_DIR/MultiSEngine.dll"

# TCR (Team Color and Ranks)
download_plugin "https://github.com/Pryaxis/Plugins/raw/master/1.4.4/TCR/TCR.dll" "$PLUGINS_DIR/TCR.dll"

# Vote system
download_plugin "https://github.com/Pryaxis/Plugins/raw/master/1.4.4/Vote/Vote.dll" "$PLUGINS_DIR/Vote.dll"

# Auto Team
if [ ! -s "$PLUGINS_DIR/AutoTeam.dll" ]; then
    echo "NOTE: AutoTeam.dll already exists but should be checked to ensure compatibility"
fi

# Crossplay
download_plugin "https://github.com/Pryaxis/Plugins/raw/master/1.4.4/Crossplay/Crossplay.dll" "$PLUGINS_DIR/Crossplay.dll"

# Multi Server Chat
download_plugin "https://github.com/Pryaxis/Plugins/raw/master/1.4.4/MultiServerChat/MultiServerChat.dll" "$PLUGINS_DIR/MultiServerChat.dll"

echo "All plugins downloaded or verified!"
echo "Now rebuild and restart your Docker container with: docker-compose up --build -d" 