#!/usr/local/bin/bash

cat -- csv/*.csv > csv/episodio-siete.csv &&
sed -i 's/\"//g' csv/episodio-siete.csv &&
sed -i '2,${/artista,fecha,visitas/d;}' csv/episodio-siete.csv
