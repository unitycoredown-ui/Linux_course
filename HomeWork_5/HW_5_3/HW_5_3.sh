#!/bin/bash


FILE="$1"
ACT_FILE="available_products.csv"

echo "Общая стоимость товаров для категорий"

awk -F, '
NR > 1 { total_cost[$3] += $4 * $5 }
END { for (category in total_cost) {
        printf "%s,%2.f\n", category, total_cost[category]
    }
}' "$FILE" | sort -t, -k2,2nr

echo
echo "Создание available_products.csv"
echo

sed -n '1p' "$FILE" > "$ACT_FILE"
sed -n '2,$p' "$FILE" | sed '/,0$/d' >> "$ACT_FILE"

echo "Названия товаров с ценой выше 100"

while IFS= read -r line; do
    ((line_number++))

    if [ $line_number -eq 1 ]; then
        continue
    fi
    echo "$line" | awk -F, '$4 > 100 {print $2}'
    
done < "$ACT_FILE"