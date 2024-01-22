#!/bin/bash

# Find the ID of the Silead touchscreen device with the name "silead_ts"
TOUCHSCREEN_ID=$(xinput list | grep -i "silead_ts" | grep -i "pointer" | grep -oP 'id=\K\d+')

# Check if the ID is found
if [ -n "$TOUCHSCREEN_ID" ]; then
    # Set the coordinate transformation matrix
    xinput --set-prop $TOUCHSCREEN_ID "Coordinate Transformation Matrix" 0 1 0 -1 0 1 0 0 1
	echo "Coordinate transformation matrix set for Silead touchscreen (ID: $TOUCHSCREEN_ID)."
else
	echo "Silead touchscreen 'silead_ts' not found. Make sure it is connected and recognized by xinput."
fi

