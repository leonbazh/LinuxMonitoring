#!/bin/bash

FolderGen() {
  folder_name=$1
  current_date=$(date +%d%m%y)
  random_number=$((RANDOM % 4 + 4))
  random_letters=$(tr -dc "$folder_name" < /dev/urandom | fold -w $random_number | head -n 1)
  generated_folder_name="${folder_name}${random_letters}_$current_date"
  echo $generated_folder_name
}