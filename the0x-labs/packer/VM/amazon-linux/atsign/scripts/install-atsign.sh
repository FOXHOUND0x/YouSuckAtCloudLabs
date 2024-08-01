#!/usr/bin/env bash

set -euo pipefail

SCRIPT_URL="https://github.com/atsign-foundation/noports/releases/latest/download/universal.sh"
SCRIPT_NAME="universal.sh"

echo "Downloading $SCRIPT_NAME..."
curl -L "$SCRIPT_URL" -o "$SCRIPT_NAME"

if [[ -f "$SCRIPT_NAME" ]]; then
    echo "$SCRIPT_NAME downloaded successfully."
    
    chmod u+x "$SCRIPT_NAME"
    
    echo "Executing $SCRIPT_NAME..."
    ./"$SCRIPT_NAME" -d the_0x -c cobalt_client -n the_0x -t client -r am -q
else
    echo "Failed to download $SCRIPT_NAME. Please check your internet connection and try again."
    exit 1
fi
