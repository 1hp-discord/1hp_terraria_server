## TShock Basic Commands

These commands are generally available to all players upon registration and login.

| Command                             | Description                                           |
|-------------------------------------|-------------------------------------------------------|
| `/help`                             | Displays a list of available commands. |
| `/register <username> <password>`   | Registers a new TShock account. |
| `/login <username> <password>`      | Logs into your TShock account. |
| `/logout`                           | Logs out of your TShock account. |
| `/who` or `/online`                 | Shows a list of online players. |
| `/motd`                             | Displays the message of the day. |
| `/time`                             | Displays the current in-game time. |
| `/roll`                             | Rolls a random number (1-100 by default). |
| `/me <action>`                      | Sends a text emote in chat. |
| `/tell <player> <message>`          | Sends a private message to a specific player. |
| `/reply` or `/r <message>`          | Replies to the last private message received. | ([TShock Permission List - GameserverKings](https://www.gameserverkings.com/knowledge-base/terraria/tshock-permission-list/?utm_source=chatgpt.com))

---

## TShock Administrative Commands

These commands are typically reserved for users with administrative privileges.

| Command                             | Description                                           |
|-------------------------------------|-------------------------------------------------------|
| `/kick <player> [reason]`           | Kicks the specified player from the server. |
| `/ban <player> [reason]`            | Bans the specified player from the server. |
| `/unban <player>`                   | Unbans the specified player. |
| `/mute <player>`                    | Prevents a player from speaking in chat. |
| `/unmute <player>`                  | Removes a mute from a player. |
| `/give <item> [quantity]`           | Gives an item to yourself or a target player. |
| `/spawnmob <mob> [quantity]`        | Spawns the specified mob. |
| `/butcher`                          | Kills all hostile mobs nearby. |
| `/time set <day/night>`             | Sets the in-game time. |
| `/worldsave` or `/save`             | Forces a manual world save. |
| `/tp <player>`                      | Teleports to a player. |
| `/tphere <player>`                  | Teleports a player to you. |
| `/spawn`                            | Teleports you back to world spawn. |
| `/warp <warpName>`                  | Teleports you to a predefined warp location. |
| `/heal [player]`                    | Heals you or another player. |
| `/reload`                           | Reloads TShock plugins and configurations. |
| `/exit` or `/off`                   | Safely shuts down the server. |

---

## User and Group Management

Manage user accounts and permissions effectively using these commands.

| Command                                         | Description                                           |
|-------------------------------------------------|-------------------------------------------------------|
| `/user add <username> <password> <group>`       | Adds a new user to a specified group. |
| `/user del <username>`                          | Deletes a user account. |
| `/user group add <username> <group>`            | Adds a user to a specific group. |
| `/user group remove <username> <group>`         | Removes a user from a specific group. |
| `/group add <group> [permissions]`              | Creates a new group with optional permissions. |
| `/group del <group>`                            | Deletes an existing group. |
| `/group addperm <group> <permission>`           | Grants a permission to a group. |
| `/group delperm <group> <permission>`           | Removes a permission from a group. |
| `/group list`                                   | Lists all existing groups. |
| `/group listperm <group>`                       | Lists all permissions assigned to a group. | ([Terraria TShock Server Admin Commands and how to add admins](https://xgamingserver.com/blog/terraria-tshock-server-admin-commands-and-how-to-add-admins/?utm_source=chatgpt.com))

---

## Region Management

Define and control protected areas within your world.

| Command                                         | Description                                           |
|-------------------------------------------------|-------------------------------------------------------|
| `/region add <name>`                            | Creates a new region with the specified name. |
| `/region set <name>`                            | Sets the boundaries for the specified region. |
| `/region remove <name>`                         | Deletes the specified region. |
| `/region protect <name>`                        | Toggles protection on/off for a region. |
| `/region allow <name> <player>`                 | Grants a player access to a protected region. |
| `/region remove <name> <player>`                | Revokes a player's access to a protected region. |
| `/region allowg <name> <group>`                 | Grants a group access to a protected region. |
| `/region removeg <name> <group>`                | Revokes a group's access to a protected region. |
| `/region expand <name> <direction> <amount>`    | Expands a region's boundary in a specified direction. |