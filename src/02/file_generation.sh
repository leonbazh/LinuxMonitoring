#!/bin/bash

FileGen() {
  file_name=$1
  current_date=$(date +%d%m%y)
  random_number=$((RANDOM % 4 + 4))
  random_letters=$(tr -dc "${file_name%%.*}" < /dev/urandom | fold -w $random_number | head -n 1)
  generated_file_name="${file_name%%.*}${random_letters}_$current_date.${file_name#*.}"
  echo $generated_file_name
}