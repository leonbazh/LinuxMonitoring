#!/bin/bash

InputValidation() {
  if [ "$#" -ne 3 ]; then
    echo there should be 3 parameters
    echo example: main.sh az az.az 4Mb
    exit 1
  elif [[ ${#1} -gt 7 ]] || ! [[ $1 =~ ^[a-zA-Z]+$ ]]; then
    echo first parameter must consist of English letters and have no more than 7 symbols
    echo example: main.sh az az.az 4Mb
    exit 1
  elif [[ $2 != *.* ]]; then
    echo second parameter must consist of dot
    echo example: main.sh az az.az 4Mb
    exit 1
  elif ! [[ ${2%%.*} =~ ^[a-zA-Z]{1,7}$ ]] || ! [[ ${2#*.} =~ ^[a-zA-Z]{1,3}$ ]]; then
    echo name of file must consist of English letters and have no more than 7 symbols before dot and 3 after
    echo example: main.sh az az.az 4Mb
    exit 1
  elif (( ${3%%Mb*} < 0 || ${3%%Mb*} > 100 )); then
    echo size must be no more than 100Mb and no less than 0Mb
    echo example: main.sh az az.az 4Mb
    exit 1
  fi
}