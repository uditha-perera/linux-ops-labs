#!/bin/bash

THRESHOLD=80

echo "Checking disk usage..."

df -h --output=pcent,target | tail -n +2 | while read usage mount;
do
  usage=${usage%\%}

  if [ "$usage" -ge "$THRESHOLD" ]; then
    echo "WARNING: Disk usage on $mount is ${usage}%"
  fi
done
