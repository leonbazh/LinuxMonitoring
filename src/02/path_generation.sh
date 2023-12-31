#!/bin/bash

PathGen() {
  pwd=$(find / -type d -writable \( ! -path "*bin*" -a ! -path "*sbin*" \) 2>/dev/null | shuf -n 1)
  folder=($(FolderGen $1))
  path="${pwd%/}/${folder%/}"
  echo $path
}