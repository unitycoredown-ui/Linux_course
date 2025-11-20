#!/bin/bash
FILE="$1"
# Задача: Найти все валидные email-адреса в логе.
grep -Eo '[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}' "$FILE" | sort | uniq