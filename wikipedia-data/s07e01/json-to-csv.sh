#!/usr/local/bin/bash


# Guardamos en un array la lista de artistas que han participado en el episodio
readarray -t artist < ~/github/wiki-cachitos/wikipedia-data/s07e01/s07e01.txt

nombres=('Roberto Carlos' 'Camilo Sesto' 'Glenn Medeiros' 'Richard Anthony' 'Gilbert Bécaud' 'Lionel Richie' 'Pablo Abraira' 'Dani Martín' 'Enrique Guzmán ' 'Lolita' 'Karina' 'Raúl' 'Chayanne' 'Alaska y Dinarama' 'Estopa' 'Luis Aguilé' 'Kaoma' 'Lou Bega' 'Los Bravos' 'Los Payos' 'Miguel Ángel Muñoz' 'The Communards' 'La Oreja de Van Gogh' 'Silver Convention' 'Cher' 'Buraka Som Sistema' 'Boney M.' 'Double You' 'Whigfield' 'Becky G' 'Natti Natasha' 'Aitana' 'Sandro Giacobbe' 'Pop-Tops' 'Pic-nic' 'Umberto Tozzi' 'Ricardo Cocciante' 'Les Surfs' 'Sandie Shaw' 'Barry Ryan' 'Enigma!' 'Patrick Hernández' 'Londonbeat' 'F. R. David' 'Guru Josh' 'Imagination' 'Innocence' 'Anita Ward' 'Ana Belén' 'Víctor Manuel' 'Culture Club' 'Julio Iglesias' 'Raphael' 'Roxette' 'Mecano' 'Nino Bravo' 'Mike Oldfield' 'Tom Jones' 'Dúo Dinámico' 'Elton John' 'Manolo Otero' 'Carlos Baute' 'Desireless' 'Los Diablos' 'Eddy Grant' 'Luis Fonsi' 'Los Planetas' 'Violadores del Verso' 'Depeche Mode' 'Europe' 'Astrud')

# Recorremos el array de artistas
for (( i=0; i<${#artist[@]}; ++i )); do

jq -r '["artista", "fecha", "visitas"], (.[] | [.artista, .fecha, .visitas ]) | @csv' json/"${artist[$i]}"-limpio.json > csv/"${nombres[$i]}".csv

done
