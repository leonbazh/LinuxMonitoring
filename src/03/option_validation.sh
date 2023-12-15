#!/bin/bash

OptionValidation() {
case $1 in
    1)
        CleanUpLog
        ;;
    2)
        CleanUpTime
        ;;
    3)
        CleanUpMask
        ;;
    *)
        echo "parameter 1, 2 or 3."
        exit 1
        ;;
esac
}