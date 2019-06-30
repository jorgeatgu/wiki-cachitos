#!/usr/local/bin/bash


# Guardamos en un array la lista de artistas que han participado en el episodio
readarray -t artist < ~/github/wiki-cachitos/wikipedia-data/s07e02/s07e02.txt

nombres=('Revólver' 'La Guardia' 'Amistades Peligrosas' 'OBK' 'Ella Baila Sola' 'Modestia Aparte' 'Cómplices' 'Greta y los Garbo' 'Tam Tam Go!' 'Ketama' 'Presuntos Implicados' 'La trampa' 'Enrique Iglesias' 'Los lunes que quedan' 'David Santisteban' 'Jesús Vázquez' 'Gabinete Caligari' 'Los Sencillos' 'La Oreja de Van Gogh' 'Los Ronaldos' 'Loquillo' 'Rosario Flores' 'Kiko Veneno' 'Rosana' 'Jarabedepalo' 'Emilio Aragón' 'Los Toreros Muertos' 'Los Inhumanos' 'Un Pingüino en mi Ascensor' 'No me pises que llevo chanclas' 'Viceversa' 'Objetivo Birmania' 'José Ángel Hevia' 'Ana Torroja' 'Nacho Cano' 'Diego Vasallo' 'Álex de la Nuez' 'Christina y Los Subterráneos' 'David Summers' 'Mikel Erentxun' 'Santiago Auserón' 'Los Flechazos' 'Los Limones' 'Tahúres Zurdos' 'Los Piratas' 'Mercedes Ferrer' 'Ciudad Jardín' '21 Japonesas' 'Los Romeos' 'Esclarecidos' 'Amaral' 'Olé Olé' 'Alejandro Sanz' 'Mónica Naranjo' 'Seguridad Social' 'Celtas Cortos')

# Recorremos el array de artistas
for (( i=0; i<${#artist[@]}; ++i )); do

jq -r '["artista", "fecha", "visitas"], (.[] | [.artista, .fecha, .visitas ]) | @csv' json/"${artist[$i]}"-limpio.json > csv/"${nombres[$i]}".csv

done
