#!/bin/bash
echo "SCRIPT REMOTO ATUALIZAÇÃO DE SERVIDOR VARNISH MULTISITE INICIADO"

mkdir /var/coletivoOpenSource/varnish/ -p

if [ ! -d '/var/coletivoOpenSource/varnish/' ]
then 
   echo "A pasta /var/coletivoOpenSource/varnish/ não pôde ser criada"
   exit 1
fi

if [ -d '/var/coletivoOpenSource/varnishInstall' ]
then 
echo "a pasta de arquivo temporaria foi encontrada no sistema removendo antes do clone"
rm /var/coletivoOpenSource/varnishInstall -rf 
else
echo "iniciando clone da pasta de instalação"
fi
cd /var/coletivoOpenSource/
git clone https://github.com/salviof/servicoVarnishWordpressDockerComposer.git varnishInstall

cd /var/coletivoOpenSource/


cp /var/coletivoOpenSource/varnishInstall/servicos/varnish/docker-compose.yml /var/coletivoOpenSource/varnish/ -f

if [ ! -f "/var/coletivoOpenSource/varnishInstall/servicos/varnish/.env" ]  
then
    echo "Arquivo env não encontrado, implantando arquivo env padrão "
    cp /var/coletivoOpenSource/varnishInstall/servicos/varnish/.envExemplo /var/coletivoOpenSource/varnish/.env -f
fi


cd /var/coletivoOpenSource/varnishInstall/servicos/varnish/builderDockerfileVarnish
./buildimagem.sh

if [ -d '/var/coletivoOpenSource/varnishInstall' ]
then 
rm /var/coletivoOpenSource/varnishInstall -rf
else 
echo "erro localizando pasta de instalação do contexto"
exit 1
fi

cd /var/coletivoOpenSource/varnish/
docker-compose up -d
echo " - Parabéns para mim :D,"
echo " - o SCRIPT BASH! "
echo "O SERVIDOR foi atualizado com sucesso!"


