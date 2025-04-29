#!/bin/bash

# This script runs the tModLoader server

echo "=== tModLoader Server Startup Script ==="
echo "Current directory: $(pwd)"
echo "Listing content of current directory:"
ls -la

# Look for server start script first
if [ -f "/tmodloader/start-tModLoaderServer.sh" ]; then
  echo "Found server start script"
  chmod +x /tmodloader/start-tModLoaderServer.sh
  echo "Running server start script"
  exec /tmodloader/start-tModLoaderServer.sh -config /tmodloader/serverconfig.txt -port 7780 -maxplayers 100 -worldpath /tmodloader/worlds
elif [ -f "/tmodloader/tModLoader.dll" ]; then
  # Use dotnet to run .NET assembly (most likely scenario for modern tModLoader)
  echo "Found tModLoader.dll, running with dotnet"
  exec dotnet /tmodloader/tModLoader.dll -server -config /tmodloader/serverconfig.txt -port 7780 -maxplayers 100 -worldpath /tmodloader/worlds
else
  # If no direct executable found, try to find any other viable executable
  echo "Searching for tModLoader executable..."
  # Exclude common non-executable extensions and paths
  EXECUTABLE=$(find /tmodloader -type f -executable -name "tModLoader*" | grep -v ".bmp\|.xml\|.json\|.config\|.pdb\|.dll\|.sh\|.bat" | head -1)
  
  if [ -n "$EXECUTABLE" ]; then
    echo "Found executable at: $EXECUTABLE"
    chmod +x "$EXECUTABLE"
    
    echo "Starting server using executable: $EXECUTABLE"
    exec "$EXECUTABLE" -server -config /tmodloader/serverconfig.txt -port 7780 -maxplayers 100 -worldpath /tmodloader/worlds
  else
    echo "No direct executable found. Trying to use .NET runtime..."
    if [ -f "/tmodloader/tModLoader.dll" ]; then
      echo "Found tModLoader.dll, will run with dotnet"
      exec dotnet /tmodloader/tModLoader.dll -server -config /tmodloader/serverconfig.txt -port 7780 -maxplayers 100 -worldpath /tmodloader/worlds
    else
      echo "ERROR: No tModLoader executable or assemblies found!"
      echo "Listing all files in /tmodloader:"
      find /tmodloader -type f | grep -v "Libraries" | sort
      exit 1
    fi
  fi
fi 