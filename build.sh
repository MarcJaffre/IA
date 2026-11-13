#!/usr/bin/bash

set -e # Arrête le script immédiatement en cas d'erreur

# ======================================================================================
CONFIG_FILE_1="./config/llama.conf"
CONFIG_FILE_2="./config/openwebui.conf"
CONFIG_FILE_3="./config/stablediffusion.conf"

# ======================================================================================
if [ -f "$CONFIG_FILE_1" ]; then
  source "$CONFIG_FILE_1" 
else
  echo "Erreur : Le fichier $CONFIG_FILE_1 est introuvable."; 
  exit 1;
fi
# ======================================================================================
