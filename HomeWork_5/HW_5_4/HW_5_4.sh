#!/bin/bash
FILE="$1"
sed -e 's/[{}"]//g' -e 's/ //g' -e 's/:/=/g' -e 's/,/\n/g' "$FILE" > config.txt

awk '{print "CONF_" $0}' config.txt > config_prefixed.txt

IFS=$'\n'
for line in $(cat config_prefixed.txt)
do
  export "$line"
  echo "Экспортировано $line"
done

rm -f config.txt
rm -f config_prefixed.txt

echo "Проверка экспорта"
env | grep "CONF_"