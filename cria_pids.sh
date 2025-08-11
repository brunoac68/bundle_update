#!/bin/bash

# Verifica se o arquivo 'modulos' existe
if [ ! -f modulos ]; then
  echo "Arquivo 'modulos' não encontrado."
  exit 1
fi

# Lê cada linha do arquivo modulos
while IFS='|' read -r modulo _; do
  # Ignora linhas vazias
  [ -z "$modulo" ] && continue

  # Cria o diretório tmp/pids dentro do módulo
  mkdir -p "$modulo/tmp/pids"
  echo "Criado: $modulo/tmp/pids"
done < modulos
