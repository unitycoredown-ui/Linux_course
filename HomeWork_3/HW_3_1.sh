#!/bin/bash

GFF_F=$1

R_DIR="terminal_task/results"

OUTPUT="${R_DIR}/result.tsv"

mkdir -p "$R_DIR"

awk '
BEGIN { FS="\t"; OFS="\t" }
$3 != "gene" { next } #остаются только строки со значением gene в 3 колонке 
/gene_type=unprocessed_pseudogene/  #Остаются только те строки, в 9 колонке которых содержится “gene_type=unprocessed_pseudogene”
    {
    match($9, /gene_name=([^;]+)/, arr) # 
    gene_name = arr[1]
    if ($7 == "+") { #Если ген располагается на “+” - цепи, то координата старта остаётся неизменной, а координата конца = координате старта + 1 (т. к. Правая граница не включается)
        new_start = $4
        new_end = $4 + 1
    } else if ($7 == "-") { #Если ген располагается на “-” - цепи, то координата старта = координате конца, а к координате конца необходимо прибавить 1 (т. к. Правая граница не включается)
        new_start = $5
        new_end = $5 + 1
    } else {
        next
    } 
    print $1, new_start, new_end, $7, gene_name #остаются только столбцы 1 (хромосома),4 (координата начала),5 (координата конца), 7,9
} ' "$GFF_F" > "$OUTPUT"

cat "$OUTPUT"