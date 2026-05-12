#!/bin/bash
#logged every 5 minutes | edit at crontab -e

OUT="/workspaces/linux/systemLogs/systemReport_$(TZ="America/Los_Angeles" date +"%F_%H-%M-%S").log"
mkdir -p systemLogs

{

echo "=============================================="
echo "              SYSTEM REPORT"
echo "=============================================="

top -bn1 | grep "Cpu(s)" | awk '{print "CPU Usage: User:", $2, "% System:", $4, "% Idle:", $8 "%"}'

echo
echo "Memory Usage:"
free -h | head -2

DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

echo
echo "Disk Usage: ${DISK_USAGE}%"

if [ "$DISK_USAGE" -gt 80 ]; then
  echo "WARNING: Disk usage is high!"
else
  echo "Disk usage is ok"
fi

MEM_AVAILABLE=$(free | awk '/Mem:/ {printf("%.0f"), $7/$2 * 100.0}')

echo "Memory Available: ${MEM_AVAILABLE}%"

echo

curl -s --head https://8.8.8.8 >/dev/null && echo "Internet: CONNECTED" || echo "Internet: DISCONNECTED"

echo "Generated at: $(TZ="America/Los_Angeles" date)" 

} > "$OUT"

cat "$OUT"
