#!/bin/bash

PLUGINS_DIR="./tshock/plugins"
TEMP_DIR="./temp_downloads"
mkdir -p "$PLUGINS_DIR"
mkdir -p "$TEMP_DIR"

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

# Function to download and extract zip file
download_and_extract_zip() {
    local url="$1"
    local zip_file="$2"
    local src_path="$3"
    local dest_path="$4"
    
    # Download the zip file
    if [ ! -s "$zip_file" ]; then
        echo "Downloading $zip_file..."
        curl -L "$url" -o "$zip_file"
        echo "Downloaded $zip_file"
    else
        echo "$zip_file already exists, skipping download"
    fi
    
    # Extract the files
    echo "Extracting $zip_file..."
    unzip -o "$zip_file" -d "$TEMP_DIR"
    
    # Copy the files to the destination
    echo "Copying files from $TEMP_DIR/$src_path to $dest_path"
    cp -f "$TEMP_DIR/$src_path" "$dest_path"
}

# Function to download and extract all DLLs from a directory in a zip file
download_and_extract_all_dlls() {
    local url="$1"
    local zip_file="$2"
    local src_dir="$3"
    local dest_dir="$4"
    
    # Download the zip file
    if [ ! -s "$zip_file" ]; then
        echo "Downloading $zip_file..."
        curl -L "$url" -o "$zip_file"
        echo "Downloaded $zip_file"
    else
        echo "$zip_file already exists, skipping download"
    fi
    
    # Extract the files
    echo "Extracting $zip_file..."
    unzip -o "$zip_file" -d "$TEMP_DIR"
    
    # Debug - list extracted files
    echo "Listing extracted files:"
    ls -la "$TEMP_DIR"
    ls -la "$TEMP_DIR"/*
    
    # Copy all DLL files to the destination
    echo "Copying all DLLs from $TEMP_DIR/$src_dir to $dest_dir"
    find "$TEMP_DIR/$src_dir" -name "*.dll" -type f -print
    find "$TEMP_DIR/$src_dir" -name "*.dll" -type f -exec cp -fv {} "$dest_dir" \;
    
    # Handle case where the path might be different
    if [ ! -d "$TEMP_DIR/$src_dir" ]; then
        echo "Directory $TEMP_DIR/$src_dir not found, attempting to find DLLs in extracted folders"
        find "$TEMP_DIR" -name "*.dll" -type f -print
        find "$TEMP_DIR" -name "*.dll" -type f -exec cp -fv {} "$dest_dir" \;
    fi
}

# List Plugins plugin
download_plugin "https://github.com/Arthri/ListPluginsPlugin/releases/download/1.0.1/ListPluginsPlugin.dll" "$PLUGINS_DIR/ListPluginsPlugin.dll"

# MultiSEngine (server linking)
echo "Processing MultiSEngine..."
download_and_extract_zip "https://github.com/Megghy/MultiSEngine/releases/download/1.1.0.3/MultiSEngine.zip" "$TEMP_DIR/MultiSEngine.zip" "MultiSEngine/TShock adaptation plugin(TShock 适配插件)/MultiSEngine.TShock.dll" "$PLUGINS_DIR/MultiSEngine.TShock.dll"

# TerrariaChatRelay
echo "Processing TerrariaChatRelay..."
mkdir -p "$TEMP_DIR/tcr_extract"
curl -L "https://github.com/xNarnia/TCR-TerrariaChatRelay/releases/download/v2.6.1-TS5.2.1/TerrariaChatRelay-v2.6.1-TS-5.2.1.zip" -o "$TEMP_DIR/TerrariaChatRelay.zip"
unzip -o "$TEMP_DIR/TerrariaChatRelay.zip" -d "$TEMP_DIR/tcr_extract"
echo "Listing TCR files:"
ls -la "$TEMP_DIR/tcr_extract"
find "$TEMP_DIR/tcr_extract" -name "*.dll" -type f -exec cp -fv {} "$PLUGINS_DIR" \;

# Auto Team
if [ ! -s "$PLUGINS_DIR/AutoTeam.dll" ]; then
    echo "NOTE: AutoTeam.dll already exists but should be checked to ensure compatibility"
else 
    download_plugin "https://github.com/TerraTrapezium/AutoTeam/releases/download/v1.0.0/AutoTeam.dll" "$PLUGINS_DIR/AutoTeam.dll"
fi

# Crossplay
download_plugin "https://tshock.s3.us-west-001.backblazeb2.com/Crossplay/Crossplay-1.7.0.dll" "$PLUGINS_DIR/Crossplay.dll"

# Multi Server Chat
echo "Processing MultiServerChat..."
mkdir -p "$TEMP_DIR/msc_extract"
curl -L "https://github.com/RenderBr/MultiServerChat/releases/download/1.0/Connector1.0.zip" -o "$TEMP_DIR/MultiServerChat.zip"
unzip -o "$TEMP_DIR/MultiServerChat.zip" -d "$TEMP_DIR/msc_extract"
echo "Listing MSC files:"
ls -la "$TEMP_DIR/msc_extract"
find "$TEMP_DIR/msc_extract" -name "*.dll" -type f -exec cp -fv {} "$PLUGINS_DIR" \;

# Clean up temporary files
echo "Cleaning up temporary files..."
rm -rf "$TEMP_DIR"

echo "All plugins downloaded or verified!"
echo "Now rebuild and restart your Docker container with: docker-compose up --build -d" 