#!/bin/bash

. ./input_validation.sh
. ./path_validation.sh
. ./folder_generation.sh
. ./file_generation.sh
. ./touch.sh

InputValidation $@
PathValidation $1
Touch $@
#осталось сделать только создание самого файла с указанием размера, умничка