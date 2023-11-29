#!/bin/bash

PathValidation() {
  if [ ! -d $1 ]; then
    echo "incorrect path to directory, try again"
    exit 1
  fi
}