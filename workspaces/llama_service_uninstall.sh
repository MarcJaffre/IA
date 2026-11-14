#!/usr/bin/bash
# =================================================================================================
# Arrête le script immédiatement en cas d'erreur #
# ============================================== #
set -e
# =================================================================================================
# Générer le fichier  #
# =================== #
# Github met à jour globale.conf.exemple mais pas le fichier globale.conf
if [ ! -f "./globale.conf" ]; then 
cp        "./globale.conf.exemple" "./globale.conf";
fi
# =================================================================================================
# Configuration du WORKDIR #
# ======================== #
if [ -f "./globale.conf" ]; then
  sed -i -e "s|^WORKDIR\=.*|WORKDIR=\"$(pwd)\"|g" "./globale.conf";
fi
# =================================================================================================
# Chargement de la configuration du WORKDIR #
# ========================================= #
if [ -f  "./globale.conf" ]; then
  source "./globale.conf";
else
  echo "Le fichier globale.conf n'existe pas";
fi



# =================================================================================================
# Dossier output llama #
# ==================== #
if [ -d "./output/llama.cpp/bin" ]; then
  cd    "./output/llama.cpp/bin";
else
  echo "Le dossier $(pwd)/output/llama.cpp/bin est absent";
fi


# =================================================================================================
# Suppression du service #
# ====================== #
LLAMA_SYSTEMD_DISABLED;
LLAMA_SYSTEMD_DEL;


echo "Fin de la désinstallation";
