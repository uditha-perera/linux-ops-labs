#!/bin/bash

echo "Checking CPU and memory usage..."

# CPU Load
echo "CPU Load:"
uptime

# Memory Usage
echo "Memory Usage:"
free -h

# Optional: Alert if memory usage > 80%
THRESHOLD=80
used_mem=$(free | awk '/Mem:/ {printf("%d"), $3/$2*100}')

if [ "$used_mem" -ge "$THRESHOLD" ]; then
  echo "WARNING: Memory usage is above ${THRESHOLD}% (${used_mem}%)"
fi
