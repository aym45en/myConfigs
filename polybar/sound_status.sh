#!/bin/bash

# Get sound value
get_sound_value() {
  amixer get Master | grep 'Mono:' | awk '{print $4}' | tr -d '[]'
}

# Call the function and display the result
get_sound_value