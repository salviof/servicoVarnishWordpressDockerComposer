#!/bin/bash

echo "Certifique que tenha o docker e docker-compose instalado"
echo "as portas podem ser alteradas na no arquivo .env"
echo "o script irá atualizar o arquivo /etc/hosts adicionando os sites: exemplocachewordpress1.com.br  exemplocachewordpress2.com.br  "
echo "Aperte enter para continuar"
echo "Durante o processo o script limpará os volumes com docker system prune <-ATENÇÃO"
read
./atualizarHost.sh exemplocachewordpress1.com.br
./atualizarHost.sh exemplocachewordpress2.com.br
./atualizarHost.sh exemplocachewordpress3.com.br
sudo docker-compose build
sudo docker-compose down
sudo docker system prune
sudo docker-compose up -d
echo "Entradas no arquivo /etc/hosts foram adicionadas"
echo "Acesse os endereços abaixo:"
echo "exemplocachewordpress1.com.br"
echo "exemplocachewordpress2.com.br e exemplocachewordpress3.com.br"
echo "Apérte enter para ver o log do varnish, e ctr+c para parar de ver o log (sair não vai parar o serviço) "
read 
sudo docker-compose logs -f varnish
