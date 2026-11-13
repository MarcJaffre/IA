#!/usr/bin/bash

set -e # Arrête le script immédiatement en cas d'erreur

# ======================================================================================
# Variables #
# ========= #
CONFIG_FILE='./config/globale.conf'

# ======================================================================================
# Vérification et chargement du fichier Configuration #
# =================================================== #
if [ -f "$CONFIG_FILE" ]; then
  source "$CONFIG_FILE";
else
  echo "Erreur : Le fichier $CONFIG_FILE est introuvable."; 
  exit 1;
fi

# ======================================================================================
# Dossier de Travail #
# ================== #
if [ ! -d "$WORKDIR" ]; then
 mkdir -p "$WORKDIR";
fi


