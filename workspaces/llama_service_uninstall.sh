#!/usr/bin/bash
# =================================================================================================
# Arrête le script immédiatement en cas d'erreur #
# ============================================== #
set -e

# =================================================================================================
# Générer le fichier  #
# =================== #
# Github rester globale.conf.exemple mais pas globale.conf
if [ ! -f $(pwd)/IA/globale.conf ]; then 
 echo $(pwd)/IA/globale.conf.exemple $(pwd)/IA/globale.conf;
fi

# =================================================================================================
# Configuration du WORKDIR #
# ======================== #
if [ -f $(pwd)/IA/globale.conf ]; then
 # sed -i -e "s|^WORKDIR\=.*|WORKDIR=\"$(pwd)\"|g" $(pwd)/IA/globale.conf;
 ls $(pwd)/IA/globale.conf;
fi

# =================================================================================================
# Chargement de la configuration du WORKDIR #
# ========================================= #
if [ -f "$(pwd)/IA/globale.conf" ]; then
  source "$(pwd)/IA/globale.conf";
else
  echo "Le fichier globale.conf n'existe pas";
fi












# =================================================================================================
# Dossier output llama #
# ==================== #
if [ -d "$WORKDIR/output/llama.cpp/bin" ]; then
  cd    "$WORKDIR/output/llama.cpp/bin";
else
  echo "Le dossier output/llama.cpp/bin est absent";
  exit;
fi

# =================================================================================================
# Suppression du service #
# ====================== #
LLAMA_SYSTEMD_DISABLED;
LLAMA_SYSTEMD_DEL;
