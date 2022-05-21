FILES=./sitesPublicados/*
for f in $FILES
do
#  Processando arquivo: $f 
  nomeArquivo="$(basename $f)"
  source $f
  echo "backend bcked$nomeArquivo { "
  echo ".host = \"$IPBACKEND\"; "
  echo ".port = \"$PORTA_BACKEND\";"
  echo ".max_connections = 100;"
  echo ".first_byte_timeout = 20s;"
  echo ".connect_timeout = 20s;";
  echo ".between_bytes_timeout = 20s;"
  echo "}"

done
