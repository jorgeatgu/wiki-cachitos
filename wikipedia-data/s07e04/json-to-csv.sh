#!/usr/local/bin/bash


# Guardamos en un array la lista de artistas que han participado en el episodio
readarray -t artist < ~/github/wiki-cachitos/wikipedia-data/s07e04/s07e04.txt

nombres=('Luis Eduardo Aute' 'Víctor Manuel' 'Andrés do Barro' 'Mikel Laboa' 'Raimon' 'Pablo Guerrero' 'Ovidi Montllor' 'Chicho Sánchez Ferlosio' 'Paco Ibáñez' 'Bob Dylan' 'Lichis' 'Andrés Calamaro' 'Rosendo Mercado' 'Joaquín Sabina' 'Ruper Ordorika' 'Dani Martín' 'Enrique Bunbury' 'Josele Santiago' 'Mikel Erentxun' 'Pedro Guerra' 'Tontxu' 'Ismael Serrano' 'Bebe' 'Muerdo' 'Rozalén' 'Marwan' 'Rosana' 'Luis Ramiro' 'Andrés Suárez' 'Javier Álvarez' 'Javier Krahe' 'Fernando Alfaro' 'Pau Riba' 'Ángel Stanich' 'Chenta Tsai' 'C. Tangana' 'El Niño de Elche' 'Tonino Carotone' 'Kiko Veneno' 'Antonio Orozco' 'Alejandro Sanz' 'Emilio José' 'Carlos Cano' 'José Manuel Soto' 'Javier Ruibal' 'Orquesta de Córdoba' 'Pablo Alborán' 'Camilo Sesto' 'José Luis Perales' 'Mari Trini' 'LP' 'Francisco Nixon' 'Carmen Boza' 'Depedro' 'La Bien Querida' 'Russian Red' 'Maria Rodés' 'Sr. Chinarro' 'Iván Ferreiro' 'Nacho Vegas' 'Christina Rosenvinge' 'La Excepción' '7 Notas 7 Colores' 'Pedro Guerra' 'Amparanoia' 'SFDK' 'Ismael Serrano' 'ToteKing' 'Violadores del Verso' 'Joan Manuel Serrat' 'Mala Rodríguez' 'Frank T' )

# Recorremos el array de artistas
for (( i=0; i<${#artist[@]}; ++i )); do

jq -r '["artista", "fecha", "visitas"], (.[] | [.artista, .fecha, .visitas ]) | @csv' json/"${artist[$i]}"-limpio.json > csv/"${nombres[$i]}".csv

done