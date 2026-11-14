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
# Paramétrage de ce script #
# ======================== #
RUN_LLAMA="1"

# =================================================================================================
# WORKDIR #
###########
WORKDIR="/srv/IA"

# =================================================================================================
# Chargement de la configuration du WORKDIR #
# ========================================= #
if [ -f "$WORKDIR/globale.conf" ]; then
 source "$WORKDIR/globale.conf";
fi

# =================================================================================================
# Dossier output llama #
# ==================== #
if [ $RUN_LLAMA = "1" ]; then
      if [ -d "$WORKDIR/output/llama.cpp/bin" ]; then
        cd    "$WORKDIR/output/llama.cpp/bin"  ;
      else
        echo "Le dossier output/llama.cpp/bin est absent";
        exit;
      fi
      find . -type f -iname "llama*" -exec chmod +x {} \;
      ./llama-server --host "0.0.0.0" --port "8080" --api-key admin
fi
