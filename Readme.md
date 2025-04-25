Here’s a README.md tailored for your Terraria server Docker setup, covering both TShock (vanilla+admin) and tModLoader (modded) servers, with clear instructions and explanations for each file and configuration.

---

# Terraria Server Docker Compose Setup

This repository provides a ready-to-use Docker Compose setup for running both a TShock (vanilla/admin) Terraria server and a tModLoader (modded) Terraria server in isolated containers. Each server is pre-configured for easy deployment and management.

## Features

- **TShock Server** (vanilla/admin, port 7777)
  - Full admin controls, plugins, and advanced configuration.
- **tModLoader Server** (modded, port 7778)
  - Supports Terraria mods via tModLoader.
- **Persistent Worlds**: World data is stored on your host for both servers.
- **Easy Configuration**: Edit `serverconfig.txt` files to customize your servers.

---

## File Overview

- `docker-compose.yml` — Orchestrates both servers, sets up ports and volumes.
- `tshock/Dockerfile` — Builds the TShock server image.
- `tshock/serverconfig.txt` — Default config for TShock server.
- `tmodloader/Dockerfile` — Builds the tModLoader server image.
- `tmodloader/serverconfig.txt` — Default config for tModLoader server.

---

## Quick Start

### 1. Clone the Repository

```sh
git clone <your-repo-url>
cd <your-repo-directory>
```

### 2. (Optional) Customize Server Configs

Edit the following files to adjust world names, player limits, passwords, etc.:

- `tshock/serverconfig.txt`
- `tmodloader/serverconfig.txt`

### 3. Build and Start the Servers

```sh
docker-compose up --build
```

- TShock server will be available on port **7777**.
- tModLoader server will be available on port **7778**.

### 4. Access and Manage Worlds

- TShock worlds: `./tshock/worlds` (on your host)
- tModLoader worlds: `./tmodloader/worlds` (on your host)

You can copy your own `.wld` files into these folders to use existing worlds.

---

## Configuration Details

### docker-compose.yml

- Maps ports 7777 (TShock) and 7778 (tModLoader) to your host.
- Mounts world directories for persistence.
- Restarts containers unless stopped manually.

### tshock/Dockerfile

- Installs dependencies and SteamCMD.
- Downloads the latest Terraria server and TShock release.
- Sets up the server to run with your `serverconfig.txt`.

### tmodloader/Dockerfile

- Installs dependencies and SteamCMD.
- Downloads the latest tModLoader server.
- Sets up the server to run with your `serverconfig.txt`.

### serverconfig.txt

- Controls world name, player count, password, and other server options.
- See [Terraria Wiki: Server](https://terraria.wiki.gg/wiki/Server#Configuration_file) for all options.

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

- **Ports in Use**: Make sure ports 7777 and 7778 are not used by other applications.
- **World Not Loading**: Ensure the world file specified in `serverconfig.txt` exists in the correct `worlds` directory.
- **Mod Issues**: For tModLoader, ensure mods are compatible with your tModLoader version.

---

## Credits

- [TShock](https://github.com/Pryaxis/TShock)
- [tModLoader](https://github.com/tModLoader/tModLoader)
- [Terraria](https://terraria.org/)

---

Feel free to open issues or PRs for improvements!

---

Let me know if you want this saved as a `README.md` file in your project.
