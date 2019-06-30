#!/usr/local/bin/bash

cat -- csv/*.csv > csv/episodio-tres.csv &&
sed -i 's/\"//g' csv/episodio-tres.csv &&
sed -i '2,${/artista,fecha,visitas/d;}' csv/episodio-tres.csv
