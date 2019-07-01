#!/usr/local/bin/bash


: '
 fecha de emision - promedio
---------------------------- × 100
       promedio

fecha de emision representa las visitas que
se recibieron el día de la emisión
'

# Guardamos en un array la lista de artistas que han participado en el episodio
readarray -t artist < ~/github/wiki-cachitos/wikipedia-data/s07e05/s07e05-list.txt

# Guardamos en un array las visitas que recibieron el día de la emisión
readarray -t visitas < ~/github/wiki-cachitos/wikipedia-data/s07e05/csv/visitas.csv

# Guardamos en un array el promedio de visitas
readarray -t promedio < ~/github/wiki-cachitos/wikipedia-data/s07e05/csv/mean.csv

# Recorremos el array de artistas
for (( i=0; i<${#artist[@]}; ++i )); do
    echo "scale=2; (${visitas[$i]} - ${promedio[$i]}) / ${promedio[$i]} * 100" | bc >> porcentaje-diferencia.csv
done










