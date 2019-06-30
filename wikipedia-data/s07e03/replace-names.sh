#!/usr/local/bin/bash

names=('Patti_Smith' 'Joan_Jett_%26_the_Blackhearts' 'Bonnie_Raitt' 'Suzi_Quatro' 'Olga_Guillot' 'Barbara' 'Siouxsie_And_The_Banshees' 'Vainica_Doble' 'Kate_Bush' 'Mónica_Naranjo' 'Pasión_Vega' 'María_Jiménez' 'Bebe' 'Pimpinela_(dúo)' 'Teresa_Rabal' 'Olé_Olé' 'Zahara_(cantante)' 'Beyoncé' 'Nina_Simone' 'Tracy_Chapman' 'Paquita_la_del_Barrio' 'Vulpes_(banda)' 'Cecilia_(cantautora)' 'Massiel' 'Joan_Báez' 'Salt-N-Pepa' 'The_Supremes' 'Papá_Levante' 'Las_Grecas' 'Bananarama' 'Spice_Girls' 'Ella_Baila_Sola' 'All_Saints' 'Texas_(banda)' 'Los_Romeos_(grupo_argentino)' 'Pic-nic_(banda)' 'Garbage' 'The_Cranberries' 'The_Pretenders' 'Tahúres_Zurdos' 'Blondie' 'Hinds' 'Las_Migas_(banda)' 'The_Go-Go%27s' 'Nosoträsh' 'Undershakers' 'The_Bangles' 'Björk' 'La_Paquera_de_Jerez' 'Grace_Jones' 'Rocío_Jurado' 'PJ_Harvey' 'Celia_Cruz' 'Rosalía_Vila' 'Aretha_Franklin' 'Mari_Trini' 'Cyndi_Lauper' 'Alaska_y_los_Pegamoides')

nombres=('Patti Smith' 'Joan Jett & The Blackhearts' 'Bonnie Raitt' 'Suzi Quatro' 'Olga Guillot' 'Barbara' 'Siouxsie And The Banshees' 'Vainica Doble' 'Kate Bush' 'Mónica Naranjo' 'Pasión Vega' 'María Jiménez' 'Bebe' 'Pimpinela' 'Teresa Rabal' 'Olé Olé' 'Zahara' 'Beyoncé' 'Nina Simone' 'Tracy Chapman' 'Paquita la del Barrio' 'Vulpes' 'Cecilia' 'Massiel' 'Joan Báez' 'Salt-N-Pepa' 'The Supremes' 'Papá Levante' 'Las Grecas' 'Bananarama' 'Spice Girls' 'Ella Baila Sola' 'All Saints' 'Texas' 'Los Romeos' 'Pic-nic' 'Garbage' 'The Cranberries' 'The Pretenders' 'Tahúres Zurdos' 'Blondie' 'Hinds' 'Las Migas' 'The Go-Gos' 'Nosoträsh' 'Undershakers' 'The Bangles' 'Björk' 'La Paquera de Jerez' 'Grace Jones' 'Rocío Jurado' 'PJ Harvey' 'Celia Cruz' 'Rosalía Vila' 'Aretha Franklin' 'Mari Trini' 'Cyndi Lauper' 'Alaska y los Pegamoides' )


for (( i=0; i<${#names[@]}; ++i )); do
    sed -i "s/${names[$i]}/${nombres[$i]}/g" csv/"${nombres[$i]}".csv
done
