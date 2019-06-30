#!/usr/local/bin/bash

cat -- csv/*.csv > csv/episodio-cinco.csv &&
sed -i 's/\"//g' csv/episodio-cinco.csv &&
sed -i '2,${/artista,fecha,visitas/d;}' csv/episodio-cinco.csv
