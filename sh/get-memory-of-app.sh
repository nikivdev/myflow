#!/bin/bash

# Check if an app name was provided
if [ -z "$1" ]; then
  echo "Usage: $0 <application_name>"
  echo "Example: $0 Cursor.app"
  exit 1
fi

APP_NAME=$1

# Run the command and process the output
echo -e "\nMemory usage for $APP_NAME:\n"
echo -e "PID\tMEM %\tMEM (MB)\tCOMMAND"
echo -e "---\t-----\t--------\t-------"

TOTAL_KB=0
TOTAL_PERCENT=0

# Get all processes for the app and calculate totals
while read -r pid pmem rss cmd; do
  mb=$(echo "scale=2; $rss/1024" | bc)
  echo -e "$pid\t$pmem%\t$mb MB\t${cmd:0:50}"
  TOTAL_KB=$(echo "$TOTAL_KB + $rss" | bc)
  TOTAL_PERCENT=$(echo "$TOTAL_PERCENT + $pmem" | bc)
done < <(ps -eo pid,pmem,rss,command | grep -i "$APP_NAME" | grep -v grep)

# Print the total
TOTAL_MB=$(echo "scale=2; $TOTAL_KB/1024" | bc)
TOTAL_GB=$(echo "scale=2; $TOTAL_KB/1024/1024" | bc)

echo -e "\nTotal memory usage: $TOTAL_PERCENT% ($TOTAL_MB MB / $TOTAL_GB GB)"
