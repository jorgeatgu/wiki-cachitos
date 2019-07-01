#!/usr/local/bin/bash

# Guardamos en un array la lista de artistas que han participado en el episodio
readarray -t artist < ~/github/wiki-cachitos/wikipedia-data/s07e04/s07e04-list.txt


for (( i=0; i<${#artist[@]}; ++i )); do

    csvgrep -c 1 -r "${artist[$i]}" csv/episodio-cuatro.csv | sed '/2019-06-04/d' | csvstat -c 3 --mean >> csv/mean.csv

done








