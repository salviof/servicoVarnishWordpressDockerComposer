FILES=./sitesPublicados/*

echo "sub vcl_init {"
# create the director
echo " new backendsRegistrados = stendhal.director();"
for f in $FILES
do
#  echo "Processing $f file..."
  # take action on each file. $f store current file name
  nomeArquivo="$(basename $f)"
#  echo "Processando: $nomeArquivo"
  source $f
  echo "  backendsRegistrados.add_backend(\"${DOMINIO_PRODUCAO,,}\", bcked$nomeArquivo);"
  if [[ ${DOMINIO_PRODUCAO} != "imagens"* ]];then
  echo "  backendsRegistrados.add_backend(\"www.${DOMINIO_PRODUCAO,,}\", bcked$nomeArquivo);"
  fi


done
echo "}";
