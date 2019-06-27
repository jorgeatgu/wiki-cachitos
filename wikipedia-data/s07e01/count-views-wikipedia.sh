#!/usr/local/bin/bash

: '
Dependencias: jq - sed(linux)
A partir de los JSON con las diferentes listas de spotify
vamos a obtener solamente la lista de artistas.
'

def sum(f): map(f) | add;   def consolidate:   .[0]   + {visitas:  sum(.visitas) } ;  . | group_by([.fecha]) | map(consolidate)
