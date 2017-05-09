#!/bin/bash

# Escrito por Leandro Santiago da Silva
# e-mail: leandrosansilva@gmail.com
# Cr�ticas, sugest�es, enviarem para esse e-mail.

# Programa que verifica se voc� tem um mesmo arquivo em v�rios diret�rios
# A checagem � feita via md5sum, o que faz com que mesmo que arquivoa diferentes tenham o mesmo nome, serem ainda sim considerados diferentes
# � poss�vel jogar a lista dos arquivos repetidos num arquivo de log.




## A fun��o echos eu retirei do programa funcoeszz (http://www.funcoeszz.net)

echos(){
   echo -e "\033[36;1m$*"; echo -ne "\033[m"
}

if [ -z $1 ]; then
  echo
  echo "Uso deste programa:"
  echo
  echos "$0 diret�rio-destino "
  echo
  echo "Mais informa��es, digite $0 --help"
  echo
  exit
fi

if [ $1 = '--help' ]; then
   echo
   echo "Uso deste programa:"
   echo
   echos "$0 diret�rio-destino "
   echos "$0 diret�rio-destino arquivo_de_log"
   echo
   echo "Escrito por Leandro Santiago da Silva"
   echo
   echo "leandrosansilva@gmail.com"
   echo
   exit
fi

if [ $1 = '--version' ]; then
   echo
   echos "Vers�o 0.0.0.0.0.1-beta"
   echos
   exit
fi
		
for ARQUIVO in * ; do
   if [ -e $1/$ARQUIVO 2> /dev/null ]; then
      if [ $( md5sum $ARQUIVO 2> /dev/null | cut -f1 -d' ') = $( md5sum $1/$ARQUIVO 2> /dev/null | cut -f1 -d' ' ) ]; then
      	echos $ARQUIVO 
        if [ ! -z $2 ]; then
	   echo $ARQUIVO >> $2
        fi
      fi
   fi
done 


