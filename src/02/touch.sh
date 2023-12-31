#!/bin/bash

Touch() {
  InputValidation $@
  folder=$1
  file=$2
  file_size_full=$3
  folder_count=$((RANDOM % 100 + 1))
  for(( i=1; i<=folder_count; i++ )); do
    folder_name=$(PathGen $folder)
    mkdir $folder_name
    file_count=$((RANDOM % 100 + 1))
    for(( j=1; j<=file_count; j++ )); do
      MemoryCheck
      file_name=$(FileGen $file)
      touch_path="${folder_name%/}/${file_name}"
      time=$(date +'%Y-%m-%d %H:%M:%S')
      file_size=${file_size_full%%Mb*}
      fallocate $touch_path -l $file_sizeMB
      echo path: $touch_path time: $time file_size: $file_size_full >> "log.txt"
    done
  done
}