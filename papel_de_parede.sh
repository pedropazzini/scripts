#!/bin/bash

local_folder='/usr/bin/scripts/papel_de_parede/'
log_file=$local_folder'papel_de_parede.log'
site='http://br.bing.com'
pasta_destino='/root/imagens/bing/'
arquivo_descricao=$local_folder'bing_descriptions.txt'

echo 'Iniciado às ' `date` >> $log_file
temp_file=$local_folder'temp.html'
touch $temp_file
wget -q -O $temp_file $site
imagem=$(cat $temp_file | tail -n 4 | sed 's/^.*g_img={url://' | sed 's/,id.*$//' | cut -d \' -f 2 | head -n 1)
echo $imagem
for i in $(seq $(cat $temp_file | grep title=\" | grep -o \" | wc -l))
	do 
		if $(cat $temp_file | grep title=\" | cut -d \" -f $i | grep --quiet '©')
			then
				description=$(echo $(cat $temp_file | grep title=\" | cut -d \" -f $i | grep '©'))
		fi
	done
#description=$(echo $description | php -R 'echo html_entity_decode($argn);')
echo $description
nome_imagem=$(echo $local_folder$imagem | sed s/.*%2f//g | sed 's/\/.*\///')
echo $nome_imagem
server=$site$imagem

existe=$(ls $pasta_destino | grep -i $nome_imagem)
if test -z "$existe" 
then
wget -q -O $nome_imagem $server
nome_imagem=$(echo $nome_imagem | sed 's/\/.*\///')
mv $nome_imagem $pasta_destino
echo $description >> $arquivo_descricao
rm $temp_file
fi;

echo 'Finalizado às ' `date` >> $log_file
