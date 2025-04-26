# Terraria Server Docker Compose Setup

This repository provides a ready-to-use Docker Compose setup for running both a TShock (vanilla/admin) Terraria server and a tModLoader (modded) Terraria server in isolated containers. Each server is pre-configured for easy deployment and management.

## Features

- **TShock Server** (vanilla/admin, port 7777)
  - Full admin controls, plugins, and advanced configuration.
  - Enhanced spawn rates and invasion difficulty.
  - Item-based teleportation enabled for all players.
  - No build restrictions or anti-cheat thresholds.
  - REST API enabled for external tools.
- **tModLoader Server** (modded, port 7778)
  - Supports Terraria mods via tModLoader.
- **Persistent Worlds**: World data is stored on your host for both servers.
- **Easy Configuration**: Edit `serverconfig.txt` and `config.json` files to customize your servers.

---

## File Overview

- `docker-compose.yml` — Orchestrates both servers, sets up ports and volumes.
- `tshock/Dockerfile` — Builds the TShock server image.
- `tshock/serverconfig.txt` — Basic config for TShock server.
- `tshock/config/config.json` — Advanced TShock-specific settings.
- `tshock/config/groups.json` — Permission settings for player groups.
- `tmodloader/Dockerfile` — Builds the tModLoader server image.
- `tmodloader/serverconfig.txt` — Default config for tModLoader server.

---

## Quick Start

### 1. Clone the Repository

```sh
git clone https://github.com/JonTDean/1hp_terraria_server
cd 1hp_terraria_server
```

### 2. (Optional) Customize Server Configs

Edit the following files to adjust settings:

- `tshock/serverconfig.txt` — Basic world settings
- `tshock/config/config.json` — TShock-specific settings
- `tshock/config/groups.json` — Player permissions
- `tmodloader/serverconfig.txt` — tModLoader settings

### 3. Build and Start the Servers

```sh
docker-compose up --build -d
```

- TShock server will be available on port **7777**.
- TShock REST API will be available on port **7878**.
- tModLoader server will be available on port **7778**.

### 4. Access and Manage Worlds

- TShock worlds: `./tshock/worlds` (on your host)
- tModLoader worlds: `./tmodloader/worlds` (on your host)

You can copy your own `.wld` files into these folders to use existing worlds.

---

## Server Customizations

### Enhanced Gameplay Settings

The TShock server includes the following customizations:

- **Increased Enemy Spawns**: 
  - DefaultMaximumSpawns = 20 (default: 5)
  - DefaultSpawnRate = 200 (default: 600)
  - InvasionMultiplier = 2 (default: 1)

- **Removed Restrictions**:
  - All build and action thresholds disabled (TileKill, TilePlace, etc.)
  - SpawnProtection disabled
  - RangeChecks disabled

- **Player Teleportation**:
  - All players can use Wormhole Potions, Magic Conch, Demon Conch, Pylons, and Rod of Discord

- **API Access**:
  - REST API enabled on port 7878
  - GeoIP enabled for player location tracking

---

## Configuration Details

### docker-compose.yml

- Maps ports 7777 (TShock), 7878 (REST API), and 7778 (tModLoader) to your host.
- Mounts world directories and configuration files for persistence.
- Restarts containers unless stopped manually.

### tshock/config/config.json

Contains TShock-specific settings:
- Server behavior settings (spawns, invasions, etc.)
- Player restrictions and anti-cheat controls
- REST API configuration

### tshock/config/groups.json

Contains permission settings for player groups:
- Default permissions for all players
- Admin permissions configuration

### serverconfig.txt

- Controls world name, player count, password, and other server options.
- See [Terraria Wiki: Server](https://terraria.wiki.gg/wiki/Server#Configuration_file) for all options.

---

## Server Administration

### First Time Setup

1. Join your TShock server and note the setup code in server console.
2. In-game, type `/setup [code]` to begin setup.
3. Add an admin account with `/user add [username] [password] owner`.
4. Login with your new account using `/login [username] [password]`.
5. Finish setup with `/setup`.

### REST API Access

The REST API is enabled on port 7878 and can be used with external tools to manage your server. See the [TShock API documentation](https://tshock.readme.io/reference/introduction) for details.

---

## Customization

- **World Files**: Place your `.wld` files in the appropriate `worlds` directory before starting the server.
- **Mods (tModLoader)**: To add mods, you may need to mount or copy them into the tModLoader server container. See [tModLoader documentation](https://github.com/tModLoader/tModLoader/wiki/tModLoader-guide-for-players#installing-mods) for details.

---

## Stopping the Servers

Press `Ctrl+C` in the terminal running `docker-compose`, or run:

```sh
docker-compose down
```

---

## Troubleshooting

- **Ports in Use**: Make sure ports 7777, 7878, and 7778 are not used by other applications.
- **World Not Loading**: Ensure the world file specified in `serverconfig.txt` exists in the correct `worlds` directory.
- **Mod Issues**: For tModLoader, ensure mods are compatible with your tModLoader version.

If you dont have docker/docker-compose
```zsh
# 1. Update existing list of packages
sudo apt-get update

# 2. Install required packages to allow apt to use a repository over HTTPS
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# 3. Add Docker's official GPG key
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# 4. Set up the Docker repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# 5. Update the package index again
sudo apt-get update

# 6. Install Docker Engine, CLI, and containerd
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

Add port 7777 and 7878 to your firewall
- If on windows
1. Go to windows firewall
2. Add New firewall rule
  1. port 7777
  2. Apply to tcp
  3. Specify port 7777
  4. Specify networking types
    - Domain
    - Private
    - Public
  5. Name it `terraria-server-ingress-tcp`
  6. Repeat steps 1-5 but rename `tcp` to `udp`
  7. Repeat steps 1-5 for port 7878 (REST API)

- If on Linux
```
sudo ufw allow 7777/tcp
sudo ufw allow 7777/udp
sudo ufw allow 7878/tcp
```
---

## Credits

- [TShock](https://github.com/Pryaxis/TShock)
- [tModLoader](https://github.com/tModLoader/tModLoader)
- [Terraria](https://terraria.org/)

---

Feel free to open issues or PRs for improvements!