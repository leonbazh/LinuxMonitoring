#!/bin/bash

InputValidation() {
  if [ "$#" -ne 6 ]; then
    echo there should be 6 parameters
    echo example: main.sh /opt/test 4 az 5 az.az 3kb
    exit 1
  elif [[ $1 != /* ]]; then
    echo first parameter should start with /
    echo example: main.sh /opt/test 4 az 5 az.az 3kb
    exit 1
  elif ! [[ $2 =~ ^[0-9]+([.,^/][0-9]+)?$ ]]; then
    echo second parameter should be a number
    echo example: main.sh /opt/test 4 az 5 az.az 3kb
    exit 1
  elif [[ ${#3} -gt 7 ]] || ! [[ $3 =~ ^[a-zA-Z]+$ ]]; then
    echo third parameter must consist of English letters and have no more than 7 symbols
    echo example: main.sh /opt/test 4 az 5 az.az 3kb
    exit 1
  elif ! [[ $4 =~ ^[0-9]+([.,^/][0-9]+)?$ ]]; then
    echo fourth parameter should be a number
    echo example: main.sh /opt/test 4 az 5 az.az 3kb
    exit 1
  elif [[ $5 != *.* ]]; then
    echo fifth parameter must consist of dot
    echo example: main.sh /opt/test 4 az 5 az.az 3kb
    exit 1
  elif ! [[ ${5%%.*} =~ ^[a-zA-Z]{1,7}$ ]] || ! [[ ${5#*.} =~ ^[a-zA-Z]{1,3}$ ]]; then
    echo name of file must consist of English letters and have no more than 7 symbols before dot and 3 after
    echo example: main.sh /opt/test 4 az 5 az.az 3kb
    exit 1
  elif [[ ${6%%kb*} > 100 ]] || [[ ${6%%kb*} < 1 ]]; then
    echo size must be no more than 100kb
    echo example: main.sh /opt/test 4 az 5 az.az 3kb
    exit 1
  fi
}