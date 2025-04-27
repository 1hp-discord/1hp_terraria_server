#========================================
#TShock Server Authentication Guide
#========================================

To properly use commands in TShock, you need to authenticate and register your user.

1. Step 1: Get the setup code from the server logs:

    sudo docker logs terraria_crimson_tshock | grep setup

2. Step 2: In the game, use this code to setup and become an owner:

    /setup [setup_code]
    /user add [your_username] [your_password] owner
    /login [your_username] [your_password]
    /setup

3. Step 3: For additional users, add them to desired groups:

    /user add [another_player] [password] admin
    /user add [another_player] [password] moderator
    /user add [another_player] [password] default

Available groups and their permissions:
- default: Basic teleportation, greeting, voting
- moderator: Additional management permissions
- admin: Full admin permissions
- owner: Super admin with all permissions

Common commands to try:
    /help - Shows available commands
    /mse tp crimson - Teleport to crimson world
    /mse tp corruption - Teleport to corruption world
    /mse list - Show available worlds
    /vote [command] - Start a vote for a command
    /greet [message] - Set a custom greeting message
    /user list - List registered users
    /god - Toggle god mode
    /time noon - Set time to noon

Remember: Commands won't work until you've registered and logged in!