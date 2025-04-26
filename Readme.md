# Terraria Server Docker Compose Setup

This repository provides a ready-to-use Docker Compose setup for running Terraria servers with TShock and multiple additional plugins. Each server is pre-configured for easy deployment and management.

## Features

- **TShock Server** (vanilla/admin, port 7777)
  - Full admin controls, plugins, and advanced configuration
  - Enhanced spawn rates and invasion difficulty
  - Item-based teleportation enabled for all players
  - No build restrictions or anti-cheat thresholds
  - REST API enabled for external tools
- **Corruption World Server** (port 7779)
  - Large world with corruption
  - Shares same plugins and configuration as main server
- **MultiSEngine Support** (port 7778)
  - Cross-server teleportation and player syncing
  - Allows players to travel between worlds
- **Installed Plugins**:
  - Crossplay: Enables cross-platform play between different Terraria versions
  - MultiServerChat: Inter-server chat functionality
  - OnlineAnnounceV2: Join/leave announcements
  - TCR-TerrariaChatRelay: Discord-Terraria chat integration
  - Vote: In-game voting system for bans/kicks/commands
  - MultiSEngine: Multi-server engine for world travel
  - AutoTeam: Auto-assigns players to yellow team by default
- **Persistent Worlds**: World data is stored on your host
- **Easy Configuration**: Edit config files to customize your servers

---

## File Overview

- `docker-compose.yml` — Orchestrates all servers, sets up ports and volumes
- `tshock/Dockerfile` — Builds the TShock server image
- `tshock/serverconfig.txt` — Basic config for TShock server
- `tshock/serverconfig-corruption.txt` — Config for the corruption world
- `tshock/config/config.json` — Advanced TShock-specific settings
- `tshock/config/groups.json` — Permission settings for player groups
- `tshock/config/multisengine.json` — Configuration for MultiSEngine
- `tshock/config/autoteam.json` — Settings for AutoTeam plugin
- `tshock/config/tcr.json` — Settings for Discord integration
- `tshock/config/vote.json` — Settings for Vote plugin

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
- `tshock/serverconfig-corruption.txt` — Corruption world settings
- `tshock/config/config.json` — TShock-specific settings
- `tshock/config/groups.json` — Player permissions
- `tshock/config/multisengine.json` — MultiSEngine configuration

### 3. Build and Start the Servers

```sh
# Download the plugins first
chmod +x download_plugins.sh
./download_plugins.sh

# Build and start the servers
docker-compose up --build -d
```

### 4. Server Access

- Main TShock server: Port **7777**
- TShock REST API: Port **7878**
- Corruption world server: Port **7779**
- MultiSEngine server: Port **7778**

### 5. Access and Manage Worlds

- TShock worlds: `./tshock/worlds` (on your host)

You can copy your own `.wld` files into this folder to use existing worlds.

---

## Server Customizations

### Enhanced Gameplay Settings

The TShock servers include the following customizations:

- **Increased Enemy Spawns**: 
  - DefaultMaximumSpawns = 100 (default: 5)
  - DefaultSpawnRate = 600 (default: 600)
  - InvasionMultiplier = 2 (default: 1)

- **Removed Restrictions**:
  - All build and action thresholds disabled
  - SpawnProtection disabled
  - RangeChecks disabled

- **Player Teleportation**:
  - All players can use Wormhole Potions, Magic Conch, Demon Conch, Pylons, and Rod of Discord

- **Permission Groups**:
  - Default: Basic teleportation, greeting, voting
  - Moderator: Additional management commands
  - Admin: Full access to all commands
  - Wheel: Special group for vote execution

### MultiSEngine Setup

The MultiSEngine allows players to travel between different worlds. Players can use the following commands:

- `/mse tp <servername>` - Travel to another server
- `/mse list` - List available servers
- `/mse back` - Return to the previous server

World servers are configured in `tshock/config/multisengine.json`.

---

## Configuration Details

### docker-compose.yml

- Maps multiple ports for different servers
- Mounts world directories and configuration files for persistence
- Runs multiple instances of TShock with different worlds

### TShock Configuration

Various configuration files control server behavior:
- `config.json`: Server behavior settings
- `groups.json`: Player permissions for different groups
- Plugin-specific config files for further customization

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

### Player Management

- Add users to groups with: `/user add [username] [group]`
- Available groups:
  - default: Regular player permissions
  - moderator: Moderation permissions
  - admin: Full admin permissions

---

## Stopping the Servers

Press `Ctrl+C` in the terminal running `docker-compose`, or run:

```sh
docker-compose down
```

---

## Troubleshooting

- **Ports in Use**: Make sure ports 7777, 7778, 7779, and 7878 are not used by other applications.
- **World Not Loading**: Ensure the world file exists in the correct `worlds` directory.
- **Plugin Issues**: Check the server logs for errors related to specific plugins.

### Firewall Configuration

- **Windows**:
  1. Go to Windows Firewall
  2. Add new rules for ports 7777, 7778, 7779, and 7878 (both TCP and UDP)

- **Linux**:
  ```sh
  sudo ufw allow 7777/tcp
  sudo ufw allow 7777/udp
  sudo ufw allow 7778/tcp
  sudo ufw allow 7778/udp
  sudo ufw allow 7779/tcp
  sudo ufw allow 7779/udp
  sudo ufw allow 7878/tcp
  ```

---

## Credits

- [TShock](https://github.com/Pryaxis/TShock)
- [Terraria](https://terraria.org/)
- Plugin creators:
  - [RenderBr](https://github.com/RenderBr)
  - [Maxthegreat99](https://github.com/Maxthegreat99)
  - [Megghy](https://github.com/Megghy)
  - [TerraTrapezium](https://github.com/TerraTrapezium)

---

Feel free to open issues or PRs for improvements!