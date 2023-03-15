#!/bin/bash

# Start the process
chromium-browser --headless --disable-gpu --no-sandbox --remote-debugging-port=9222 --remote-debugging-address=0.0.0.0 ${URL}${USERNAME}
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start chromium-browser: $status"
  exit $status
fi

# Naive check runs checks once a minute to see if either of the processes exited.
# This illustrates part of the heavy lifting you need to do if you want to run
# more than one service in a container. The container exits with an error
# if it detects that either of the processes has exited.
# Otherwise it loops forever, waking up every 60 seconds

while sleep 60; do
  ps aux |grep chromium-browser | grep -q -v grep
  PROCESS_1_STATUS=$?
  # If the greps above find anything, they exit with 0 status
  # If they are not both 0, then something is wrong
  if [ $PROCESS_1_STATUS -ne 0 ]; then
    echo "One of the processes has already exited."
    exit 1
  fi
done