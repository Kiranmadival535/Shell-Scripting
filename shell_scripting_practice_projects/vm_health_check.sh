#!/bin/bash

# simple_vm_health_check.sh
# This script performs a basic health check on the VM by checking CPU, memory, and disk usage.

# Check CPU usage
echo "CPU Usage:"
top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}'

# Check memory usage
echo "Memory Usage:"
free -h | grep Mem | awk '{print $3 "/" $2 " (" $3/$2*100 "%)"}'

# Check disk usage
echo "Disk Usage:"
df -h | grep -E '^/dev/'
