#!/bin/bash

# Function to simulate a loading animation with dots
function animate_dots() {
  local count=0
  local char="."
  while [[ $count -lt 5 ]]; do
    echo -en "\r[Macware]: $1$char"  # Move cursor to beginning of line (-en)
    sleep 0.2
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

echo "Download complete!"

echo -e "Downloading Latest Roblox..."
    [ -f ./RobloxPlayer.zip ] && rm ./RobloxPlayer.zip
    local version=$(curl -s "https://clientsettingscdn.roblox.com/v2/client-version/MacPlayer" | ./jq -r ".clientVersionUpload")
    curl "http://setup.rbxcdn.com/mac/$version-RobloxPlayer.zip" -o "./RobloxPlayer.zip"
    rm ./jq

    echo -n "Installing Latest Roblox... "
    [ -d "/Applications/Roblox.app" ] && rm -rf "/Applications/Roblox.app"
    unzip -o -q "./RobloxPlayer.zip"
    mv ./RobloxPlayer.app /Applications/Roblox.app
    rm ./RobloxPlayer.zip
    echo -e "Done."
