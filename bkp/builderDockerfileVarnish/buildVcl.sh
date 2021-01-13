#!/bin/bash
echo "# Este vcl foi gerado pelo script $PWD/buildVcl.sh "
echo "# Data: $date "
echo "# Diretório processado: $PWD/sitesPublicados"
cat ./templateVCL/configReferenciaCabecalho.TPLvcl
./buildBackends.sh
./buildInit.sh
cat ./templateVCL/configReferencia.TPLvcl
