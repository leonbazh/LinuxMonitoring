#!/bin/bash

MemoryCheck() {
  free_space=$(df -h / | awk 'NR==2{print $4}')
      if [[ "$free_space" == "1G" ]]; then
        echo "Ошибка: Недостаточно свободного места в файловой системе!"
        exit 1
      fi
}