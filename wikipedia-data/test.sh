#!/usr/local/bin/bash

: '
Dependencias: jq - sed(linux)
A partir de los JSON con las diferentes listas de spotify
vamos a obtener solamente la lista de artistas.
'

    curl -s "GET" "https://wikimedia.org/api/rest_v1/metrics/pageviews/per-article/es.wikipedia/mobile-app/user/Massiel/daily/20190228/20190529" | jq '.items[] | {"artista": .article, "fecha": .timestamp, "visitas": .views}'
