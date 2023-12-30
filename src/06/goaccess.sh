#!/bin/bash

GoAccess() {
  path="../04"
  conf="goaccess.conf"
  logs=$(ls $path | awk "/.log/")
  for log in $logs; do
    ((number++))
    file=$path/$log
    goaccess -p $conf $file -o stat$number.html
}