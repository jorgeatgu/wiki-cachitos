#!/usr/local/bin/bash

cat -- csv/*.csv > csv/episodio-seis.csv &&
sed -i 's/\"//g' csv/episodio-seis.csv &&
sed -i '2,${/artista,fecha,visitas/d;}' csv/episodio-seis.csv
