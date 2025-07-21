#!/bin/bash

# Navega para o diretório principal da aplicação (caso não esteja nele)
cd ~/aplicacao/g-hosp_rails6

# Verifica se o arquivo modulos existe
if [ ! -f "modulos" ]; then
  echo "Arquivo 'modulos' não encontrado!"
  exit 1
fi

# Lê cada linha do arquivo modulos
while IFS= read -r linha; do
  # Extrai o nome do módulo (parte antes do |)
  modulo=$(echo "$linha" | cut -d'|' -f1)
  
  if [ -d "$modulo" ]; then
    echo -e "\n========================================"
    echo "Atualizando módulo: $modulo"
    echo "========================================"
    
    # Entra no diretório do módulo
    cd "$modulo" || { echo "Falha ao entrar no diretório $modulo"; continue; }
    
    # Executa bundle update
    bundle update
    
    # Volta para o diretório principal
    cd ..
  else
    echo "Diretório do módulo não encontrado: $modulo"
  fi
done < "modulos"

echo -e "\nConcluído a atualização de todos os módulos!"
