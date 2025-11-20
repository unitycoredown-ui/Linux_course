#!/bin/bash
FILE="$1"
## Замена всех ненужных символов
sed 's/\r//g; s/[[:punct:]]//g; s/.*/\L&/' "$FILE" > text.txt
## Определение всех слов в что-то вроде таблицы, где первое значение будет само слово, а второе - его количество в тексте.
## Все это выгружаем в отдельный файл
## Решил добавить исключения для всяких-слов функций
awk '
BEGIN {
    stopwords["a"] = 1
    stopwords["an"] = 1  
    stopwords["the"] = 1
    stopwords["is"] = 1
    stopwords["are"] = 1
    stopwords["was"] = 1
    stopwords["were"] = 1
    stopwords["and"] = 1
    stopwords["or"] = 1
    stopwords["but"] = 1
    stopwords["in"] = 1
    stopwords["on"] = 1
    stopwords["at"] = 1
    stopwords["to"] = 1
    stopwords["for"] = 1
    stopwords["of"] = 1
    stopwords["with"] = 1
    stopwords["by"] = 1
    stopwords["this"] = 1
    stopwords["it"] = 1
    stopwords["she"] = 1
    stopwords["he"] = 1
    stopwords["from"] = 1
    stopwords["him"] = 1
    stopwords["here"] = 1
}
{ for (i=1; i<=NF; i++)
    { word = $i
    if (word != "" && !stopwords[word])
    { count[word]++ 
        } 
        } 
        }
END { for (word in count) {
print count[word], word
        }
        }' text.txt | sort -nr | head -5 | awk '{print $2 ": " $1}' > top_5.txt

## Цикл для запроса определения слов

while IFS=: read -r word _; do
word=$(echo "$word" | xargs)
res=$(curl -s "https://api.dictionaryapi.dev/api/v2/entries/en/$word")
def=$(echo "$res" | grep -o '"definition":"[^"]*"' | head -1 | cut -d'"' -f4)
echo "$word:$def"
sleep 1
done < top_5.txt