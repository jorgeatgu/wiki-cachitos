#!/usr/local/bin/bash

readarray -t names < ~/github/wiki-cachitos/wikipedia-data/s07e06/s07e06.txt

readarray -t nombres < ~/github/wiki-cachitos/wikipedia-data/s07e06/s07e06-list.txt

for (( i=0; i<${#names[@]}; ++i )); do
    sed -i "s/${names[$i]}/${nombres[$i]}/g" csv/"${nombres[$i]}".csv
done
