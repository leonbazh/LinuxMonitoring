#!/bin/bash

Sort() {
    InputValidation $1
    OptionValidation $1
    log_file="../04/access1.log"
}

SortAllCode() {
    awk '{print $9, $0}' $log_file | sort -n | cut -d' ' -f2-
}

SortUniqueIP() {
    awk '{print $1}' $log_file | sort -u
}

SortError() {
    awk '$9 ~ /^[45]/ {print}' $log_file
}

SortUniqueIPError() {
    awk '$9 ~ /^[45]/ {print $1}' $log_file | sort -u
}
