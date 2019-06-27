#!/usr/local/bin/bash

fechas=('20190318' '20190319' '20190320' '20190321' '20190322' '20190323' '20190324' '20190325' '20190326' '20190327' '20190328' '20190329' '20190330' '20190331' '20190401' '20190402' '20190403' '20190404' '20190405' '20190406' '20190407' '20190408' '20190409' '20190410' '20190411' '20190412' '20190413' '20190414' '20190415' '20190416' '20190417' '20190418' '20190419' '20190420' '20190421' '20190422' '20190423' '20190424' '20190425' '20190426' '20190427' '20190428' '20190429' '20190430' '20190501' '20190502' '20190503' '20190504' '20190505' '20190506' '20190507' '20190508' '20190509' '20190510' '20190511' '20190512' '20190513' '20190514' '20190515' '20190516' '20190517' '20190518' '20190519' '20190520' '20190521' '20190522' '20190523' '20190524' '20190525' '20190526' '20190527' '20190528' '20190529' '20190530' '20190531' '20190601' '20190602' '20190603' '20190604' '20190605' '20190606' '20190607' '20190608' '20190609' '20190610' '20190611' '20190612' '20190613' '20190614' '20190615' '20190616' '20190617' '20190618' '20190619')

fechaBuena=('2019-03-18' '2019-03-19' '2019-03-20' '2019-03-21' '2019-03-22' '2019-03-23' '2019-03-24' '2019-03-25' '2019-03-26' '2019-03-27' '2019-03-28' '2019-03-29' '2019-03-30' '2019-03-31' '2019-04-01' '2019-04-02' '2019-04-03' '2019-04-04' '2019-04-05' '2019-04-06' '2019-04-07' '2019-04-08' '2019-04-09' '2019-04-10' '2019-04-11' '2019-04-12' '2019-04-13' '2019-04-14' '2019-04-15' '2019-04-16' '2019-04-17' '2019-04-18' '2019-04-19' '2019-04-20' '2019-04-21' '2019-04-22' '2019-04-23' '2019-04-24' '2019-04-25' '2019-04-26' '2019-04-27' '2019-04-28' '2019-04-29' '2019-04-30' '2019-05-01' '2019-05-02' '2019-05-03' '2019-05-04' '2019-05-05' '2019-05-06' '2019-05-07' '2019-05-08' '2019-05-09' '2019-05-10' '2019-05-11' '2019-05-12' '2019-05-13' '2019-05-14' '2019-05-15' '2019-05-16' '2019-05-17' '2019-05-18' '2019-05-19' '2019-05-20' '2019-05-21' '2019-05-22' '2019-05-23' '2019-05-24' '2019-05-25' '2019-05-26' '2019-05-27' '2019-05-28' '2019-05-29' '2019-05-30' '2019-05-31' '2019-06-01' '2019-06-02' '2019-06-03' '2019-06-04' '2019-06-05' '2019-06-06' '2019-06-07' '2019-06-08' '2019-06-09' '2019-06-10' '2019-06-11' '2019-06-12' '2019-06-13' '2019-06-14' '2019-06-15' '2019-06-16' '2019-06-17' '2019-06-18' '2019-06-19')


for (( i=0; i<${#fechas[@]}; ++i )); do
    sed -i "s/${fechas[i]}/${fechaBuena[i]}/g" -- json/*.json
done
