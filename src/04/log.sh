#!/bin/bash

TouchLogs() {
    for(( days=1; days<=5; days++ ))
    do
        codes=("200" "201" "400" "401" "403" "404" "500" "501" "502" "503")
        # 200: успешный запрос
        # 201: создано
        # 400: неверный запрос
        # 401: неавторизовано
        # 403: запрещено
        # 404: не найдено
        # 500: внутренняя ошибка сервера
        # 501, 502, 503: другие виды ошибок и проблемы со связью между клиентом и сервером
        methods=("GET" "POST" "PUT" "DELETE" "PATCH")
        agents=("Mozilla" "Google Chrome" "Opera" "Safari" "Internet Explorer" "Microsoft Edge" "Crawler and bot" "Library and net tool")
        url_paths=("/" "/about" "/contact" "/products" "/services")
        urls=("/cats.png" "/logo.png" "/video" "/audio" "/flowers.jpg")
        month=$((1 + RANDOM % 11))
        day=$((1 + RANDOM % 25))
        num_entries=$((100 + RANDOM % 901))
        for(( i=1; i<=$num_entries; i++))
        do
            ip=$(IpGen)
            code=${codes[$RANDOM % ${#codes[@]}]}
            method=${methods[$RANDOM % ${#methods[@]}]}
            agent=${agents[$RANDOM % ${#agents[@]}]}
            url_path=${url_paths[$RANDOM % ${#url_paths[@]}]}
            url=${urls[$RANDOM % ${#urls[@]}]}
            minutes=$i
            seconds=$i++
            date=$(date -d "2023-$month-$day + $minutes minutes + $seconds seconds" +"%d/%b/%Y:%H:%M:%S %z")
            echo "$ip - - [$date] \"$method ${url_path%/}${url%/} HTTP/1.1\" $code $(( RANDOM % 1000 )) \"-\" \"$agent\"" >> access$days.log
        done
    done
}

IpGen(){
    echo $(($RANDOM%256)).$(($RANDOM%256)).$(($RANDOM%256)).$(($RANDOM%256))
}
