#!/bin/bash

InputValidation() {
  if [ "$#" -ne 1 ]; then
    echo there should be 1 parameter
    echo example: main.sh 1
    exit 1
  elif ! [[ $1 =~ ^[0-9]+([.,^/][0-9]+)?$ ]]; then
    echo parameter should be a number
    exit 1
  elif ! (( $1 >= 1 && $1 <= 4 )); then
    echo parameter should be from 1 to 4
    exit 1
  fi
}