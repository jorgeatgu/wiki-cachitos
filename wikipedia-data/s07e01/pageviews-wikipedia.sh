#!/usr/local/bin/bash

: '
Dependencias: jq
A partir de los JSON con las diferentes listas de spotify
vamos a obtener solamente la lista de artistas.
'

# Guardamos en un array la lista de artistas que han participado en el episodio
readarray -t artist < ~/github/wiki-cachitos/wikipedia-data/s07e01/s07e01.txt

type=('mobile-app' 'desktop' 'mobile-web')

# Recorremos el array de artistas
for (( i=0; i<${#artist[@]}; ++i )); do

    for (( j=0; j<${#type[@]}; ++j )); do

    # Obtenemos de la API las visitas por artistas
    # Nos quedamos solamente con el nombre del artista, las visitas y la fecha
    # Concatenamos las visitas de todos los dispositivos
    curl -s "GET" "https://wikimedia.org/api/rest_v1/metrics/pageviews/per-article/es.wikipedia/"${type[$j]}"/user/"${artist[$i]}"/daily/20190214/20190525" | jq '.items[] | {"artista": .article, "fecha": .timestamp, "visitas": .views}' >> json/"${artist[$i]}".json

    done

    # Ahora agrupamos por fecha y sumamos las visitas
    jq -s 'def sum(f): map(f) | add; def consolidate: .[0] + {visitas: sum(.visitas) } ; . | group_by([.fecha]) | map(consolidate)' json/"${artist[$i]}".json > json/"${artist[$i]}"-limpio.json &&

    rm json/"${artist[$i]}".json

done


