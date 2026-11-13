#!/usr/bin/bash

set -e # Arrête le script immédiatement en cas d'erreur

# ======================================================================================
CONFIG_FILE='./config/globale.conf'


# ======================================================================================
if [ -f "$CONFIG_FILE" ]; then
  source "$CONFIG_FILE" 
else
  echo "Erreur : Le fichier $CONFIG_FILE est introuvable."; 
  exit 1;
fi

# ======================================================================================
if [ ! -d "$WORKDIR" ]; then
 mkdir -p "$WORKDIR";
fi


