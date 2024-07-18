#!/bin/bash

# Maximum brightness value
MAX_BRIGHTNESS=4882

# Get brightness value
get_brightness_value() {
  brightnessctl get
}

# Calculate brightness percentage
calculate_brightness_percentage() {
  local brightness_value=$1
  echo $((brightness_value * 100 / MAX_BRIGHTNESS))
}

# Main function
main() {
  local brightness_value=$(get_brightness_value)
  local brightness_percentage=$(calculate_brightness_percentage $brightness_value)
  echo "$brightness_percentage%"
}

# Call the main function and display the result
main
