#!/bin/bash
echo "Certifique que tenha o docker e docker-compose instalado"
echo "as portas podem ser alteradas na no arquivo .env"
echo "o script irá atualizar o arquivo /etc/hosts adicionando os sites: exemplocachewordpress1.com.br  exemplocachewordpress2.com.br  "
echo "Aperte enter para continuar"
read
./atualizarHost.sh exemplocachewordpress1.com.br
./atualizarHost.sh exemplocachewordpress2.com.br
./atualizarHost.sh exemplocachewordpress3.com.br
sudo docker-compose build
sudo docker-compose up -d
