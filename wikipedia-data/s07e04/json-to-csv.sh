#!/usr/local/bin/bash


# Guardamos en un array la lista de artistas que han participado en el episodio
readarray -t artist < ~/github/wiki-cachitos/wikipedia-data/s07e04/s07e04.txt

# Guardamos en un array la lista de artistas que han participado en el episodio
readarray -t nombres < ~/github/wiki-cachitos/wikipedia-data/s07e04/s07e04-list.txt

# Recorremos el array de artistas
for (( i=0; i<${#artist[@]}; ++i )); do

jq -r '["artista", "fecha", "visitas"], (.[] | [.artista, .fecha, .visitas ]) | @csv' json/"${artist[$i]}"-limpio.json > csv/"${nombres[$i]}".csv

done
