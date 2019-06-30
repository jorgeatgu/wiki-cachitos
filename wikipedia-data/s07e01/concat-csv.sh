#!/usr/local/bin/bash

cat -- csv/*.csv > csv/episodio-uno.csv &&
sed -i 's/\"//g' csv/episodio-uno.csv &&
sed -i '2,${/artista,fecha,visitas/d;}' csv/episodio-uno.csv
