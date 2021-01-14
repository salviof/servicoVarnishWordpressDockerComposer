FILES=./sitesPublicados/*
for f in $FILES
do
#  echo "Processing $f file..."
  # take action on each file. $f store current file name
  nomeArquivo="$(basename $f)"
#  echo "Processando: $nomeArquivo"
  source $f
  echo "backend bcked$nomeArquivo { "
  echo ".host = \"$IPBACKEND\"; "
  echo ".port = \"PORTA_BACKEND\";"
  echo ".max_connections = 100;"
  echo ".first_byte_timeout = 20s;"
  echo ".connect_timeout = 20s;";
  echo ".between_bytes_timeout = 20s;"
  echo "}"

done
