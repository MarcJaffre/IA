#!/usr/bin/bash
# =================================================================================================
# Arrête le script immédiatement en cas d'erreur #
# ============================================== #
set -e


# =================================================================================================
# Générer le fichier  #
# =================== #
# Github rester globale.conf.exemple mais pas globale.conf
if [ ! -f globale.conf ]; then 
 cp globale.conf.exemple globale.conf;
fi

# =================================================================================================
# Configuration du WORKDIR #
# ======================== #
if [ -f globale.conf ]; then
  sed -i -e "s|^WORKDIR\=.*|WORKDIR=\"$(pwd)\"|g" globale.conf;
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
# Création du service #
# =================== #
LLAMA_SYSTEMD_ADD;
LLAMA_SYSTEMD_ENABLED;



