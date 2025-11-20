#!/bin/bash
#Создайте скрипт, который читает файл с оценками студентов (содержит 3 колонки - ФИО студента, оценка, предмет) и выводит студентов с оценкой выше заданного порога по каждому предмету).

threshold=$1 
while read -r name grade subject; do
    if [ "$grade" -gt "$threshold" ]; then
        echo "$name: $grade по $subject"
    fi
done