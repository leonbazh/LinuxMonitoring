#!/bin/bash

OptionValidation() {
    case $1 in
    1)
        SortAllCode
        ;;
    2)
        SortUniqueIP
        ;;
    3)
        SortError
        ;;
    4)
        SortUniqueIPError
        ;;
    *)
        echo "parameter 1, 2, 3 or 4."
        exit 1
        ;;
    esac
}