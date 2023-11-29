#!/bin/bash

FileGen() {
  file_count=$1
  file_name=$2
  current_date=$(date +%d%m%y)
  random_number=$(shuf -i 3-7 -n 1)
  random_letters=$(tr -dc "${file_name%%.*}" < /dev/urandom | fold -w $random_number | head -n 1)
  generated_file_name="${file_name%%.*}${random_letters}_$current_date.${file_name#*.}"
  echo $generated_file_name
}