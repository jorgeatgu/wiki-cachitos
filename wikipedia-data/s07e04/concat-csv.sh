#!/usr/local/bin/bash

cat -- csv/*.csv > csv/episodio-cuatro.csv &&
sed -i 's/\"//g' csv/episodio-cuatro.csv &&
sed -i '2,${/artista,fecha,visitas/d;}' csv/episodio-cuatro.csv
