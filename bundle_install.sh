#!/bin/bash

# Caminho do diretório principal da aplicação
APP_DIR="$HOME/aplicacao/g-hosp_rails6"

# Garante que estamos no diretório correto
cd "$APP_DIR" || { echo "Diretório da aplicação não encontrado: $APP_DIR"; exit 1; }

# Verifica se o arquivo "modulos" existe
if [ ! -f "modulos" ]; then
  echo "Arquivo 'modulos' não encontrado!"
  exit 1
fi

# Lê cada linha do arquivo "modulos"
while IFS= read -r linha || [[ -n "$linha" ]]; do
  # Extrai o nome do módulo (parte antes do "|")
  modulo=$(echo "$linha" | cut -d'|' -f1 | xargs)

  if [ -d "$modulo" ]; then
    echo -e "\n========================================"
    echo "Instalando gems no módulo: $modulo"
    echo "========================================"
    
    # Entra no diretório do módulo
    cd "$modulo" || { echo "Falha ao entrar no diretório $modulo"; continue; }
    
    # Executa bundle install
    bundle install --without development test
    
    # Volta para o diretório principal
    cd "$APP_DIR"
  else
    echo "Diretório do módulo não encontrado: $modulo"
  fi
done < "modulos"

echo -e "\nConcluída a instalação de gems em todos os módulos!"
