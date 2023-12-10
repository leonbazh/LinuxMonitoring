#!/bin/bash

Touch() {
  path=$1
  folder_count=$2
  folder_symbols=$3
  file_count=$4
  file_symbols=$5
  file_size_full=$6
  for(( i=1; i<=folder_count; i++ )); do
    folder_name=$(FolderGen $path $folder_count $folder_symbols)
    mkdir $folder_name
    for(( j=1; j<=file_count; j++ )); do
      free_space=$(df -h / | awk 'NR==2{print $4}')
      if [[ "$free_space" == "1G" ]]; then
        echo "Ошибка: Недостаточно свободного места в файловой системе!"
        exit 1
      fi
      file_name=$(FileGen $file_count $file_symbols)
      touch_path="${folder_name%/}/${file_name}"
      time=$(date +'%Y-%m-%d %H:%M:%S')
      file_size=${file_size_full%%kb*}
      dd if=/dev/zero of="$touch_path" bs=1K count="$file_size" status=none
      echo path: $touch_path time: $time file_size: $file_size_full >> "log.txt"
    done
  done
}