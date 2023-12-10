#!/bin/bash

. ./input_validation.sh
. ./folder_generation.sh
. ./file_generation.sh
. ./path_generation.sh
. ./memory.sh
. ./touch.sh

START_TIME=$(date +%s)
START_TIME_CLOCK=$(date +%T)
Touch $@
END_TIME=$(date +%s)
END_TIME_CLOCK=$(date +%T)
echo "Script start time: $START_TIME_CLOCK\
      Script end time: $END_TIME_CLOCK\
      Script execution time (in seconds) = $(( $END_TIME - $START_TIME ))" >> "log.txt"