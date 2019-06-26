#!/usr/local/bin/bash

: '
Dependencias: jq - sed(linux)
A partir de los JSON con las diferentes listas de spotify
vamos a obtener solamente la lista de artistas.
'

# Array con la lista de listas de canciones
lists=('s07e01' 's07e02' 's07e03' 's07e04' 's07e05' 's07e06')

# Recorremos el array de listas
for (( i=0; i<${#lists[@]}; ++i )); do

    jq -r '.tracks.items[].track.album.artists[].name' "${lists[$i]}".json > "${lists[$i]}".txt

done
