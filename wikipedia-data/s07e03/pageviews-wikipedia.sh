#!/usr/local/bin/bash

: '
Dependencias: jq - sed(linux)
A partir de los JSON con las diferentes listas de spotify
vamos a obtener solamente la lista de artistas.
'

# Guardamos en un array la lista de artistas que han participado en el episodio
readarray -t artist < ~/github/wiki-cachitos/wikipedia-data/s07e03/s07e03.txt

type=('mobile-app' 'desktop' 'mobile-web')

# Recorremos el array de artistas
for (( i=0; i<${#artist[@]}; ++i )); do

    for (( j=0; j<${#type[@]}; ++j )); do

    curl -s "GET" "https://wikimedia.org/api/rest_v1/metrics/pageviews/per-article/es.wikipedia/mobile-app/user/${artist[$i]}/daily/20190228/20190529" | jq '[.items[] | {"artista": .article, "fecha": .timestamp, "visitas": .views}]' > "${artist[$i]}"-"${type[$j]}".json

    done

done
