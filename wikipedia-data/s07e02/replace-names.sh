#!/usr/local/bin/bash

names=('Revólver_(banda)' 'La_Guardia_(banda)' 'Amistades_Peligrosas_(dúo)' 'OBK' 'Ella_Baila_Sola' 'Modestia_Aparte' 'Cómplices_(dúo)' 'Greta_y_los_Garbo' 'Tam_Tam_Go!' 'Ketama_(grupo_musical)' 'Presuntos_Implicados' 'La_trampa' 'Enrique_Iglesias' 'Los_lunes_que_quedan' 'David_Santisteban' 'Jesús_Vázquez' 'Gabinete_Caligari' 'Los_Sencillos' 'La_Oreja_de_Van_Gogh' 'Los_Ronaldos' 'Loquillo_(cantante)' 'Rosario_Flores' 'Kiko_Veneno' 'Rosana' 'Jarabedepalo' 'Emilio_Aragón' 'Los_Toreros_Muertos' 'Los_Inhumanos' 'Un_Pingüino_en_mi_Ascensor' 'No_me_pises_que_llevo_chanclas' 'Viceversa_(banda)' 'Objetivo_Birmania_(grupo)' 'José_Ángel_Hevia' 'Ana_Torroja' 'Nacho_Cano' 'Diego_Vasallo' 'Álex_de_la_Nuez' 'Christina_y_Los_Subterráneos' 'David_Summers' 'Mikel_Erentxun' 'Santiago_Auserón' 'Los_Flechazos' 'Los_Limones' 'Tahúres_Zurdos' 'Los_Piratas' 'Mercedes_Ferrer' 'Ciudad_Jardín_(banda)' '21_Japonesas' 'Los_Romeos_(grupo_argentino)' 'Esclarecidos' 'Amaral' 'Olé_Olé' 'Alejandro_Sanz' 'Mónica_Naranjo' 'Seguridad_Social_(banda)' 'Celtas_Cortos')

nombres=('Revólver' 'La Guardia' 'Amistades Peligrosas' 'OBK' 'Ella Baila Sola' 'Modestia Aparte' 'Cómplices' 'Greta y los Garbo' 'Tam Tam Go!' 'Ketama' 'Presuntos Implicados' 'La trampa' 'Enrique Iglesias' 'Los lunes que quedan' 'David Santisteban' 'Jesús Vázquez' 'Gabinete Caligari' 'Los Sencillos' 'La Oreja de Van Gogh' 'Los Ronaldos' 'Loquillo' 'Rosario Flores' 'Kiko Veneno' 'Rosana' 'Jarabedepalo' 'Emilio Aragón' 'Los Toreros Muertos' 'Los Inhumanos' 'Un Pingüino en mi Ascensor' 'No me pises que llevo chanclas' 'Viceversa' 'Objetivo Birmania' 'José Ángel Hevia' 'Ana Torroja' 'Nacho Cano' 'Diego Vasallo' 'Álex de la Nuez' 'Christina y Los Subterráneos' 'David Summers' 'Mikel Erentxun' 'Santiago Auserón' 'Los Flechazos' 'Los Limones' 'Tahúres Zurdos' 'Los Piratas' 'Mercedes Ferrer' 'Ciudad Jardín' '21 Japonesas' 'Los Romeos' 'Esclarecidos' 'Amaral' 'Olé Olé' 'Alejandro Sanz' 'Mónica Naranjo' 'Seguridad Social' 'Celtas Cortos')


for (( i=0; i<${#names[@]}; ++i )); do
    sed -i "s/${names[$i]}/${nombres[$i]}/g" csv/"${nombres[$i]}".csv
done
