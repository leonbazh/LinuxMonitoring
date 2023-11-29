#!/bin/bash

FolderGen() {
  folder_path=$1
  folder_count=$2
  folder_name=$3
  current_date=$(date +%d%m%y)
  random_number=$(shuf -i 3-7 -n 1)
  random_letters=$(tr -dc "$folder_name" < /dev/urandom | fold -w $random_number | head -n 1)
  generated_folder_name="${folder_path%/}/${folder_name}${random_letters}_$current_date"
  echo $generated_folder_name
}