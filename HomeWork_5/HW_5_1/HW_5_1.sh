#!/bin/bash

FILE="$1"

awk '/^[0-9]/ {print $1, $9}' "$FILE" > status_codes.txt

sed -E 's/4[0-9][0-9]/CLIENT_ERROR/g' "$FILE" > errors.log

for IP in $(awk '{print $1}' status_codes.txt | sort | uniq); do
 count=$(grep -c "^$IP " status_codes.txt)
 echo "IP: $IP - Запросов: $count"
done

