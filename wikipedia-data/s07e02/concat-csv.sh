#!/usr/local/bin/bash

cat -- csv/*.csv > csv/episodio-dos.csv &&
sed -i 's/\"//g' csv/episodio-dos.csv &&
sed -i '2,${/artista,fecha,visitas/d;}' csv/episodio-dos.csv
