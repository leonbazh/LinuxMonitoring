#!/bin/bash

CleanUp() {
    InputValidation $@
    OptionValidation $@
}

CleanUpLog() {
    filename=$(grep path ../02/log.txt | awk '/path: / {print $2}')
    foldername=$(dirname $filename)
    rm -rf $filename $foldername
}

CleanUpTime() {
    input_file="../02/log.txt"
    echo "Enter start time (YYYY-MM-DD HH:MM):"
    read -r start_time
    echo "Enter end time (YYYY-MM-DD HH:MM):"
    read -r end_time
    while IFS= read -r line; do
      if [[ $line == *"time:"* ]]; then    
        if [[ $line == *$start_time* ]]; then
          inside_interval=true
        elif [[ $line == *$end_time* ]]; then
          inside_interval=false
          filename=$(echo "$line" | awk '{print $2}')
          foldername=$(dirname $filename)
          rm -rf $filename $foldername
          break
        fi
      fi
  
      if [[ "$inside_interval" == true ]]; then
        filename=$(echo "$line" | awk '{print $2}')
        foldername=$(dirname $filename)
        rm -rf $filename $foldername
      fi
    done < "$input_file"
}

CleanUpMask() {
    input_file="../02/log.txt"
    echo "Enter mask (example azzzaz_141223.az):"
    read -r mask
    while IFS= read -r line; do
      if [[ $line == *"path:"* ]]; then    
        if [[ $line == *$mask* ]]; then
          inside_interval=true
          filename=$(echo "$line" | awk '{print $2}')
          foldername=$(dirname $filename)
          rm -rf $filename $foldername
          break
        fi
      fi
    done < "$input_file"
}