#!/bin/bash
#Напишите скрипт, который проверяет формат файла CSV/TSV-файл и далее проверяет их на корректность (одинаковое количество столбцов в каждой строке).
F=$1
Del=""

if [[ "$F" == *.csv ]]; then
	Del=","	echo "Формат файла корректен, .csv"
	IFS=$'\n' read -d '' -r -a counting < <(awk -F'$Del' '{print NF}' "$F")
	for i in "${counting[@]}"; do
		if [[ "$i" -ne "${counting[0]}" ]]; then
			echo "Количество столбцов в строках не совпадает"
			exit 1
			fi
	done
	echo "Количество столбцов в строках является одинаковым"
	exit 0
elif [[ "$F" == *.tsv ]]; then
	Del=$'\t'
	echo "Формат файла корректен, .tsv"
	IFS=$'\n' read -d "" -r -a counting < <(awk -F'$Del' '{print NF}' "$F")
	for i in "${counting[@]}"; do
		if [[ "$i" -ne "${counting[0]}" ]]; then
			echo "Количество столбцов в строках не совпадает"
			exit 1
			fi
	done
	echo "Количество столбцов в строках является одинаковым"
	exit 0
else
	echo "Неправильный формат файла. (Должен быть .csv или .tsv)"
	exit 1
fi


