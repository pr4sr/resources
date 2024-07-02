#!/bin/bash

#code below is just pre-cautionary
#if [ -f "installer.sh" ]; then
#  echo "[Warning]: A script named 'installer.sh' already exists."
#  echo "Do you want to delete it and continue? (y/N)"
#  read -r -p "" response

  # User confirmation and deletion (optional)
 # if [[ $response =~ ^[Yy]$ ]]; then
  #  echo "Deleting 'installer.sh'..."
   # rm -f "installer.sh"
    # echo "Deleted."
  #else
   # echo "Exiting..."
  #fi
#fi
clear 
# loading animation with dots
function animate_dots() {
  local count=0
  local char="."
  while [[ $count -lt 5 ]]; do
    echo -en "\r[Macware]: $1$char"  # moves cursor to beginning of line (-en)
    sleep 3
    char="$char."
    ((count++))
  done
  echo  # prints a newline after the animation
}

# simulate checking online status
animate_dots "Grabbing resources..."

# download and installation instructions (simulated)
animate_dots "Downloading Macware.."

# prompt user for confirmation
echo -e "\n[Macware]: This script will uninstall/reinstall your roblox."

# user wants to continue 
echo -e "[Macware]: Grabbing the latest roblox version."
    [ -f ./RobloxPlayer.zip ] && rm ./RobloxPlayer.zip
    local version=$(curl -s "https://clientsettingscdn.roblox.com/v2/client-version/MacPlayer" | ./jq -r ".clientVersionUpload")
    curl "http://setup.rbxcdn.com/mac/$version-RobloxPlayer.zip" -o "./RobloxPlayer.zip"
    rm ./jq

echo -n "Installing Latest Version of Roblox (don't close, will take time.)"
    [ -d "/Applications/Roblox.app" ] && rm -rf "/Applications/Roblox.app"
    unzip -o -q "./RobloxPlayer.zip"
    mv ./RobloxPlayer.app /Applications/Roblox.app
    rm ./RobloxPlayer.zip
    echo -e "Done."
    
lib_url="https://github.com/pr4sr/resources/blob/main/libs/lib.sh"

curl -fsSL "$lib_url" > "lib.sh"
if [[ $? -eq 0 ]]; then
  echo "[Macware]: Downloaded 'lib.sh'"
else
  echo "[Macware]: Error downloading 'lib.sh'"
  # Consider keeping the script running here (optional)
  # exit 1  # Exit with error status (optional)
fi
