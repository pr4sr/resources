#!/bin/bash

# Define the target folder path
target_folder="$HOME/Desktop/Macware"

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

# Check if the 'installer.sh' file exists
if [[ ! -f "installer.sh" ]]; then
  echo "File 'installer.sh' not found."
  exit 1  # Exit with error status
fi

# Move the file to the target folder
mv "installer.sh" "$target_folder"
if [[ $? -eq 0 ]]; then
  echo "Successfully moved 'installer.sh' to '$target_folder'"
else
  echo "Error moving 'installer.sh' to '$target_folder'"
  exit 1  # Exit with error status
fi
