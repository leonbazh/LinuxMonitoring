#!/bin/bash

. ./goaccess.sh

if [[ $# -ne 0 ]];then
  echo script should run without parameters
  exit 1
else 
  GoAccess
  done
fi
