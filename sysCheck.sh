#!/bin/bash

echo "=============================================="
echo "              SYSTEM REPORT"
echo "=============================================="

echo "CPU Usage:"
top -bn1 | grep "Cpu(s)" | awk '{print "CPU Usage: User:", $2, "% System:", $4, "% Idle:", $8 "%"}'

echo
echo "Memory Usage:"
free -h

DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

echo "Disk Usage: ${DISK_USAGE}%"

if [ "$DISK_USAGE" -gt 80 ]; then
  echo "⚠ WARNING: Disk usage is high!"
fi

MEM_AVAILABLE=$(free | awk '/Mem:/ {printf("%.0f"), $7/$2 * 100.0}')

echo "Memory Available: ${MEM_AVAILABLE}%"


echo

echo "Generated at: $(date)"
