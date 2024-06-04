#!/bin/bash

# Get CPU usage percentage
get_cpu_usage() {
  local prev_total=$(grep 'cpu ' /proc/stat | awk '{print $2+$3+$4+$5}')
  sleep 1
  local curr_total=$(grep 'cpu ' /proc/stat | awk '{print $2+$3+$4+$5}')
  local total_time=$((curr_total - prev_total))
  local idle_time=$((curr_total - prev_total - (curr_total - prev_total) * 100 / total_time))
  echo "$((100 * (total_time - idle_time) / total_time))%"
}

# Call the function and display the result
get_cpu_usage