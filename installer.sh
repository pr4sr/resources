#!/bin/bash

# Function to simulate a loading animation with dots
function animate_dots() {
  local count=0
  local char="."
  while [[ $count -lt 5 ]]; do
    echo -en "\r[Macware]: $1$char"  # Move cursor to beginning of line (-en)
    sleep 3
    char="$char."
    ((count++))
  done
  echo  # Print a newline after the animation
}

# Simulate checking online status
animate_dots "Grabbing resources..."

# Download and installation instructions (simulated)
animate_dots "Downloading Macware.."
animate_dots "Installing latest Roblox application"

# Prompt user for confirmation
echo -e "\n[Macware]: This script will uninstall/reinstall your roblox."
echo -e "[Macware]: Continue? (y/N)"

read -r -p "" response

# Check user response (case-insensitive)
if [[ $response =~ ^[Yy]$ ]]; then
  # User wants to continue 
  echo -e "[Macware]: Grabbing the latest roblox version."
    [ -f ./RobloxPlayer.zip ] && rm ./RobloxPlayer.zip
    local version=$(curl -s "https://clientsettingscdn.roblox.com/v2/client-version/MacPlayer" | ./jq -r ".clientVersionUpload")
    curl "http://setup.rbxcdn.com/mac/$version-RobloxPlayer.zip" -o "./RobloxPlayer.zip"
    rm ./jq

  animate_dots -n "Installing Latest Version of Roblox (don't close, will take time.)"
    [ -d "/Applications/Roblox.app" ] && rm -rf "/Applications/Roblox.app"
    unzip -o -q "./RobloxPlayer.zip"
    mv ./RobloxPlayer.app /Applications/Roblox.app
    rm ./RobloxPlayer.zip
    echo -e "Done."

else
  # User doesn't want to continue
  echo "[Macware]: Installation cancelled."
fi

