#!/bin/bash

# Get CPU percentage directly without additional output
cpu_percentage=$(top -bn1 | awk 'NR>7 { sum += $9; } END { printf "%.2f", sum / NR; }')

# Print CPU with percentage
echo "$cpu_percentage%"
