#!/bin/bash

clear
# define the text with proper spacing
# prints the text to the console
echo "$text"
echo " "
echo "[Macware]: Error downloading Macware. (not released to the public)"
sleep 3
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
