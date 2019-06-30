#!/usr/local/bin/bash

names=('Luis_Eduardo_Aute' 'Víctor_Manuel_(cantante)' 'Andrés_do_Barro' 'Mikel_Laboa' 'Raimon' 'Pablo_Guerrero' 'Ovidi_Montllor' 'Chicho_Sánchez_Ferlosio' 'Paco_Ibáñez' 'Bob_Dylan' 'Lichis' 'Andrés_Calamaro' 'Rosendo_Mercado' 'Joaquín_Sabina' 'Ruper_Ordorika' 'Dani_Martín' 'Enrique_Bunbury' 'Josele_Santiago' 'Mikel_Erentxun' 'Pedro_Guerra' 'Tontxu' 'Ismael_Serrano' 'Bebe' 'Muerdo' 'Rozalén' 'Marwan_(poeta)' 'Rosana' 'Luis_Ramiro' 'Andrés_Suárez' 'Javier_Álvarez_(cantautor)' 'Javier_Krahe' 'Fernando_Alfaro_(músico)' 'Pau_Riba' 'Ángel_Stanich' 'Chenta_Tsai' 'C._Tangana' 'El_Niño_de_Elche' 'Tonino_Carotone' 'Kiko_Veneno' 'Antonio_Orozco' 'Alejandro_Sanz' 'Emilio_José' 'Carlos_Cano' 'José_Manuel_Soto' 'Javier_Ruibal' 'Orquesta_de_Córdoba' 'Pablo_Alborán' 'Camilo_Sesto' 'José_Luis_Perales' 'Mari_Trini' 'LP_(cantante)' 'Francisco_Nixon' 'Carmen_Boza' 'Depedro' 'La_Bien_Querida' 'Russian_Red' 'Maria_Rodés' 'Sr._Chinarro' 'Iván_Ferreiro' 'Nacho_Vegas' 'Christina_Rosenvinge' 'La_Excepción' '7_Notas_7_Colores' 'Pedro_Guerra' 'Amparanoia' 'SFDK' 'Ismael_Serrano' 'ToteKing' 'Violadores_del_Verso' 'Joan_Manuel_Serrat' 'Mala_Rodríguez' 'Frank_T')

nombres=('Luis Eduardo Aute' 'Víctor Manuel' 'Andrés do Barro' 'Mikel Laboa' 'Raimon' 'Pablo Guerrero' 'Ovidi Montllor' 'Chicho Sánchez Ferlosio' 'Paco Ibáñez' 'Bob Dylan' 'Lichis' 'Andrés Calamaro' 'Rosendo Mercado' 'Joaquín Sabina' 'Ruper Ordorika' 'Dani Martín' 'Enrique Bunbury' 'Josele Santiago' 'Mikel Erentxun' 'Pedro Guerra' 'Tontxu' 'Ismael Serrano' 'Bebe' 'Muerdo' 'Rozalén' 'Marwan' 'Rosana' 'Luis Ramiro' 'Andrés Suárez' 'Javier Álvarez' 'Javier Krahe' 'Fernando Alfaro' 'Pau Riba' 'Ángel Stanich' 'Chenta Tsai' 'C. Tangana' 'El Niño de Elche' 'Tonino Carotone' 'Kiko Veneno' 'Antonio Orozco' 'Alejandro Sanz' 'Emilio José' 'Carlos Cano' 'José Manuel Soto' 'Javier Ruibal' 'Orquesta de Córdoba' 'Pablo Alborán' 'Camilo Sesto' 'José Luis Perales' 'Mari Trini' 'LP' 'Francisco Nixon' 'Carmen Boza' 'Depedro' 'La Bien Querida' 'Russian Red' 'Maria Rodés' 'Sr. Chinarro' 'Iván Ferreiro' 'Nacho Vegas' 'Christina Rosenvinge' 'La Excepción' '7 Notas 7 Colores' 'Pedro Guerra' 'Amparanoia' 'SFDK' 'Ismael Serrano' 'ToteKing' 'Violadores del Verso' 'Joan Manuel Serrat' 'Mala Rodríguez' 'Frank T' )


for (( i=0; i<${#names[@]}; ++i )); do
    sed -i "s/${names[$i]}/${nombres[$i]}/g" csv/"${nombres[$i]}".csv
done
