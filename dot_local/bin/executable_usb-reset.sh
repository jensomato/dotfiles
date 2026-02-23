#!/bin/bash

# Default values
TARGET_ID_VENDOR=""
TARGET_ID_PRODUCT=""
QUIET_MODE=false

# Parse named parameters
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -v|--vendorId) TARGET_ID_VENDOR="$2"; shift ;;
        -p|--productId) TARGET_ID_PRODUCT="$2"; shift ;;
        -q|--quiet) QUIET_MODE=true ;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

# Function to print messages only if not in quiet mode
print_message() {
    if [ "$QUIET_MODE" = false ]; then
        echo "$1"
    fi
}

# Check if both vendorId and productId were provided
if [ -z "$TARGET_ID_VENDOR" ] || [ -z "$TARGET_ID_PRODUCT" ]; then
    print_message "Usage: $0 -v <idVendor> -p <idProduct>"
    print_message "   or: $0 --vendorId <idVendor> --productId <idProduct>"
    exit 1
fi

DEVICE_DIR=""

# Iterate through all USB device directories
for dir in /sys/bus/usb/devices/*; do
    if [ -d "$dir" ]; then
        # Check if idProduct and idVendor files exist and contain the target values
        if [ -f "$dir/idProduct" ] && [ -f "$dir/idVendor" ]; then
            current_idProduct=$(cat "$dir/idProduct")
            current_idVendor=$(cat "$dir/idVendor")

            if [ "$current_idProduct" == "$TARGET_ID_PRODUCT" ] && [ "$current_idVendor" == "$TARGET_ID_VENDOR" ]; then
                DEVICE_DIR="$dir"
                break # Found the device, exit the loop
            fi
        fi
    fi
done

if [ -z "$DEVICE_DIR" ]; then
    print_message "Device with idProduct=$TARGET_ID_PRODUCT and idVendor=$TARGET_ID_VENDOR not found."
    exit 1
fi

AUTHORIZE_FILE="$DEVICE_DIR/authorized"

if [ -f "$AUTHORIZE_FILE" ]; then
    print_message "Resetting device: $DEVICE_DIR"
    echo 0 | sudo tee "$AUTHORIZE_FILE" > /dev/null
    sleep 1 # Give the system a moment to recognize the change
    echo 1 | sudo tee "$AUTHORIZE_FILE" > /dev/null
    print_message "Device reset complete."
else
    print_message "Authorization file not found at $AUTHORIZE_FILE. Cannot reset device."
    exit 1
fi

exit 0
