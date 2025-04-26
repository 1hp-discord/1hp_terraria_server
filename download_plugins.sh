#!/bin/bash

PLUGINS_DIR="./tshock/plugins"
mkdir -p $PLUGINS_DIR

echo "Downloading plugins to $PLUGINS_DIR..."

# Crossplay
echo "Downloading Crossplay..."
wget -q https://github.com/RenderBr/Crossplay/releases/latest/download/Crossplay.dll -O $PLUGINS_DIR/Crossplay.dll

# MultiServerChat
echo "Downloading MultiServerChat..."
wget -q https://github.com/RenderBr/MultiServerChat/releases/latest/download/MultiServerChat.dll -O $PLUGINS_DIR/MultiServerChat.dll

# OnlineAnnounceV2
echo "Downloading OnlineAnnounceV2..."
wget -q https://github.com/Maxthegreat99/OnlineAnnounceV2/releases/latest/download/OnlineAnnounceV2.dll -O $PLUGINS_DIR/OnlineAnnounceV2.dll

# TCR-TerrariaChatRelay
echo "Downloading TCR-TerrariaChatRelay..."
wget -q https://github.com/RenderBr/TCR-TerrariaChatRelay/releases/latest/download/TCR.dll -O $PLUGINS_DIR/TCR.dll

# Vote
echo "Downloading Vote..."
wget -q https://github.com/RenderBr/Vote/releases/latest/download/Vote.dll -O $PLUGINS_DIR/Vote.dll

# MultiSEngine
echo "Downloading MultiSEngine..."
wget -q https://github.com/Megghy/MultiSEngine/releases/latest/download/MultiSEngine.dll -O $PLUGINS_DIR/MultiSEngine.dll

# AutoTeam
echo "Downloading AutoTeam..."
wget -q https://github.com/TerraTrapezium/AutoTeam/releases/latest/download/AutoTeam.dll -O $PLUGINS_DIR/AutoTeam.dll

echo "All plugins downloaded successfully!"
echo "Now rebuild and restart your Docker container with: docker-compose up --build -d" 