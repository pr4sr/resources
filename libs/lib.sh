#!/bin/bash

clear
# Define the target folder path
target_folder="$HOME/Desktop/Macware"
libs_folder="$target_folder/libs"

# Check if the target folder exists
if [[ ! -d "$target_folder" ]]; then
  # Create the target folder if it doesn't exist
  mkdir -p "$target_folder"
  if [[ $? -eq 0 ]]; then
    echo "[Macware]: Created folder '$target_folder'"
  else
    echo "[Macware]: Error creating folder '$target_folder'"
    exit 1  # Exit with error status
  fi
fi

# Check if the "libs" folder exists within the target folder
if [[ ! -d "$libs_folder" ]]; then
  # Create the "libs" folder
  mkdir -p "$libs_folder"
  if [[ $? -eq 0 ]]; then
    echo "[Macware]: Created folder '$libs_folder'"
  else
    echo "[Macware]: Error creating folder '$libs_folder'"
    exit 1  # Exit with error status
  fi
fi

# Get the script's absolute path (alternative approach)
script_path="$(realpath "$0")"  # Uses "realpath" to get absolute path

# Delete 'installer.sh'
if [[ -f "installer.sh" ]]; then
  rm -f "installer.sh"
  if [[ $? -eq 0 ]]; then
    echo "[Macware]: Deleted 'installer.sh'"
  else
    echo "[Macware]: Error deleting 'installer.sh'"
    exit 1  # Exit with error status
  fi
fi

main_installer="https://raw.githubusercontent.com/pr4sr/resources/main/libs/main.sh"

curl -fsSL "$main_installer" > "main.sh"
if [[ $? -eq 0 ]]; then
  echo "[Macware]: Downloaded the main installer."
  bash main.sh
else
  echo "[Macware]: Error downloading 'main.sh'"
  fi
