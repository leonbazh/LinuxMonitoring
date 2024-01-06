#!/bin/bash

output_file="/etc/nginx/metrics/metrics.html"

while true
do
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
    memory_usage=$(free | awk '/Mem/ { printf("%.2f"), $3/$2 * 100 }')
    disk_usage=$(df -h / | awk 'NR==2 {print $5}')
    
    timestamp=$(date +%s)
    
    cat <<EOF >$output_file
# TYPE system_cpu_usage gauge
system_cpu_usage{instance="localhost"} $cpu_usage $timestamp
# TYPE system_memory_usage gauge
system_memory_usage{instance="localhost"} $memory_usage $timestamp
# TYPE system_disk_usage gauge
system_disk_usage{instance="localhost"} $disk_usage $timestamp
EOF

    sleep 3
done