#!/usr/local/bin/bash


# Guardamos en un array la lista de artistas que han participado en el episodio
readarray -t artist < ~/github/wiki-cachitos/wikipedia-data/s07e03/s07e03.txt

nombres=('Patti Smith' 'Joan Jett & The Blackhearts' 'Bonnie Raitt' 'Suzi Quatro' 'Olga Guillot' 'Barbara' 'Siouxsie And The Banshees' 'Vainica Doble' 'Kate Bush' 'Mónica Naranjo' 'Pasión Vega' 'María Jiménez' 'Bebe' 'Pimpinela' 'Teresa Rabal' 'Olé Olé' 'Zahara' 'Beyoncé' 'Nina Simone' 'Tracy Chapman' 'Paquita la del Barrio' 'Vulpes' 'Cecilia' 'Massiel' 'Joan Báez' 'Salt-N-Pepa' 'The Supremes' 'Papá Levante' 'Las Grecas' 'Bananarama' 'Spice Girls' 'Ella Baila Sola' 'All Saints' 'Texas' 'Los Romeos' 'Pic-nic' 'Garbage' 'The Cranberries' 'The Pretenders' 'Tahúres Zurdos' 'Blondie' 'Hinds' 'Las Migas' 'The Go-Gos' 'Nosoträsh' 'Undershakers' 'The Bangles' 'Björk' 'La Paquera de Jerez' 'Grace Jones' 'Rocío Jurado' 'PJ Harvey' 'Celia Cruz' 'Rosalía Vila' 'Aretha Franklin' 'Mari Trini' 'Cyndi Lauper' 'Alaska y los Pegamoides' )

# Recorremos el array de artistas
for (( i=0; i<${#artist[@]}; ++i )); do

jq -r '["artista", "fecha", "visitas"], (.[] | [.artista, .fecha, .visitas ]) | @csv' json/"${artist[$i]}"-limpio.json > csv/"${nombres[$i]}".csv

done
