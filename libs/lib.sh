#!/bin/bash

# Define the target folder path
target_folder="$HOME/Desktop/Macware"
libs_folder="$target_folder/libs"

# Check if the target folder exists
if [[ ! -d "$target_folder" ]]; then
  # Create the target folder if it doesn't exist
  mkdir -p "$target_folder"
  if [[ $? -eq 0 ]]; then
    echo "Created folder '$target_folder'"
  else
    echo "Error creating folder '$target_folder'"
    exit 1  # Exit with error status
  fi
fi

# Check if the "libs" folder exists within the target folder
if [[ ! -d "$libs_folder" ]]; then
  # Create the "libs" folder
  mkdir -p "$libs_folder"
  if [[ $? -eq 0 ]]; then
    echo "Created folder '$libs_folder'"
  else
    echo "Error creating folder '$libs_folder'"
    exit 1  # Exit with error status
  fi
fi

# Get the script's absolute path (alternative approach)
script_path="$(realpath "$0")"  # Uses "realpath" to get absolute path

# Move the script itself (alternative approach)
mv "$script_path" "$libs_folder"
if [[ $? -eq 0 ]]; then
  echo "Successfully moved script to '$libs_folder'"
  # Source the script from the new location (alternative approach)
  . "$libs_folder/$(basename "$script_path")"  # Source the script after move
else
  echo "Error moving script to '$libs_folder'"
  exit 1  # Exit with error status
fi

# Move 'installer.sh' to the target folder
mv "installer.sh" "$target_folder"
if [[ $? -eq 0 ]]; then
  echo "Successfully moved 'installer.sh' to '$target_folder'"
else
  echo "Error moving 'installer.sh' to '$target_folder'"
  exit 1  # Exit with error status
fi
