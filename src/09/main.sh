#!/bin/bash

output_file="/etc/nginx/metrics/metrics.html"

while true
do
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
    memory_usage=$(free | awk '/Mem/ { printf("%.2f"), $3/$2 * 100 }')
    memory_free=$(free | awk '/Mem/ {print $2}')
    disk_total=$(df / | awk 'NR==2 {print $2}')
    disk_usage=$(df / | awk 'NR==2 {print $3}')
    disk_free=$(df / | awk 'NR==2 {print $4}')
    
    echo "system_cpu_usage $cpu_usage
    system_memory_usage $memory_usage
    system_memory_free $memory_free
    system_disk_usage $disk_usage
    system_disk_free $disk_free
    system_disk_total $disk_total" > "metrics.html"

    sleep 3
done