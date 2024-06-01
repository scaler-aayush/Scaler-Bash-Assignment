#script code for question 2
#!/bin/bash

# Define the target directory
TARGET_FOLDER="/path/to/your/directory"

# Check if the directory exists
if [ ! -d "$TARGET_FOLDER" ]; then
  echo "Directory $TARGET_FOLDER does not exist."
  exit 1
fi

# Initialize an associative array to store file extension counts
declare -A EXTENSION_COUNTS

# Loop through each file in the directory recursively
while IFS= read -r -d '' FILE; do
  # Get the file extension
  EXTENSION="${FILE##*.}"
  
  # If the file has no extension, set it to "No Extension"
  if [ "$EXTENSION" = "$FILE" ]; then
    EXTENSION="No Extension"
  else
    EXTENSION=".$EXTENSION"
  fi

  # Convert the extension to lowercase
  EXTENSION=$(echo "$EXTENSION" | tr '[:upper:]' '[:lower:]')
  
  # Increment the count for this extension
  ((EXTENSION_COUNTS["$EXTENSION"]++))
done < <(find "$TARGET_FOLDER" -type f -print0)

# Clear the screen
clear

# Print the results
echo "File types and their counts:"
for EXT in "${!EXTENSION_COUNTS[@]}"; do
  echo "$EXT: ${EXTENSION_COUNTS[$EXT]}"
done
