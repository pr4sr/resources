#!/bin/bash

# Define the text with proper spacing
text=" _ __ ___  __ _ _____   ____ _ _ __ ___ 
 | '_ ` _ \ / _` |/ __\ \ /\ / / _` | '__/ _ \
 | | | | | | (_| | (__ \ V V / (_| | | | __/
 |_| |_| |_|\__,_|\___| \_/\_/ \__,_|_| \___|
"

# Print the text to the console
echo "$text"
echo " "
echo "[Macware]: Error downloading Macware. (not released to the public)"
echo "Joining the discord for updates!"

# the discord link
discord_link="https://discord.gg/FVHDTvRqK6"  # Replace with your Discord server invite link

# check the operating system
os_name=$(uname -s)

if [[ "$os_name" == "Linux" ]]; then
  # use xdg-open for Linux
  xdg-open "$discord_link"
  echo "Redirecting you to the Discord server (Linux)..."

elif [[ "$os_name" == "Darwin" ]]; then
  # use open command for macOS
  open "$discord_link"
  echo "Redirecting you to the Discord server (macOS)..."

else
  # handle unsupported OS (optional)
  echo "Unsupported operating system. Script not applicable."
fi
