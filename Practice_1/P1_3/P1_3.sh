#!/bin/bash
#Создайте скрипт, который находит 10 самых частых слов в текстовом файле.

F1=$1

awk '
{
    for (i=1; i<=NF; i++) {
        word = tolower($i)
        gsub(/[^a-zA-Zа-яА-Я]/, "", word)
        
        if (word != "" && length(word) > 1) {
            count[word]++
        }
    }
}
END {
    for (word in count) {
        print count[word], word
    }
}' "$F1" | sort -nr | head -10 | awk '{print $2}'
