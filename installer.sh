#!/bin/bash

# Define the directory to check
macware_dir="$HOME/Macware"  # Replace with the actual Macware directory path if different

# Check if the Macware directory exists
if [[ -d "$macware_dir" ]]; then
  echo "[Macware]: Found an old Macware directory: $macware_dir"

  # Delete the Macware directory and its contents recursively
  rm -rf "$macware_dir"
  echo "[Macware]: Deleted the old Macware directory and its contents."
fi
# Check for installer.sh and lib.sh in the current directory
if [[ -f "./installer.sh" && -f "./lib.sh" ]]; then
  echo "[Macware]: Found installer.sh and lib.sh in current directory."

  # Delete installer.sh
  rm "./installer.sh"
  echo "[Macware]: Deleted installer.sh."

  # Delete lib.sh
  rm "./lib.sh"
  echo "[Macware]: Deleted lib.sh."
fi

# Download and install installer.sh (ensure curl is installed)
echo "Downloading and installing installer.sh..."
curl -sSL https://raw.githubusercontent.com/pr4sr/resources/main/installer.sh > installer.sh
if [[ $? -eq 0 ]]; then
  # Installation successful (check exit code)
  echo "Downloaded installer.sh successfully."
  bash installer.sh  # Execute the downloaded installer.sh
else
  echo "Error downloading installer.sh. Please check the URL and network connectivity."
fi

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
    
lib_url="https://raw.githubusercontent.com/pr4sr/resources/main/libs/lib.sh"

curl -fsSL "$lib_url" > "lib.sh"
if [[ $? -eq 0 ]]; then
  echo "[Macware]: Downloaded 'lib.sh'"
  bash lib.sh
else
  echo "[Macware]: Error downloading 'lib.sh'"
  # Consider keeping the script running here (optional)
  # exit 1  # Exit with error status (optional)
fi
