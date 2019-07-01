#!/usr/local/bin/bash

# Guardamos en un array la lista de artistas que han participado en el episodio
readarray -t artist < ~/github/wiki-cachitos/wikipedia-data/s07e01/s07e01-list.txt


for (( i=0; i<${#artist[@]}; ++i )); do

    csvgrep -c 1 -r "${artist[$i]}" csv/episodio-uno.csv | sed '/2019-04-23/d' | csvstat -c 3 --mean >> csv/mean.csv

done








