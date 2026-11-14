#!/usr/bin/bash
# =================================================================================================
# Arrête le script immédiatement en cas d'erreur #
# ============================================== #
set -e

# =================================================================================================
# Générer le fichier  #
# =================== #
# Github rester globale.conf.exemple mais pas globale.conf
if [ ! -f "$WORKDIR/IA/globale.conf" ]; then 
cp        "$WORKDIR/IA/globale.conf.exemple" "$WORKDIR/IA/globale.conf";
else
 echo "Deja crée";
fi

# =================================================================================================
# Configuration du WORKDIR #
# ======================== #
if [ -f "$WORKDIR/IA/globale.conf" ]; then
  sed -i -e "s|^WORKDIR\=.*|WORKDIR=\"$(pwd)\"|g" "$WORKDIR/IA/globale.conf";
fi

# =================================================================================================
# Chargement de la configuration du WORKDIR #
# ========================================= #
#if [ -f  "$WORKDIR/IA/globale.conf" ]; then
#  source "$WORKDIR/IA/globale.conf";
#else
#  echo "Le fichier globale.conf n'existe pas";
#fi


# =================================================================================================
# Dossier output llama #
# ==================== #
#if [ -d "$WORKDIR/IA/output/llama.cpp/bin" ]; then
#  cd    "$WORKDIR/IA/output/llama.cpp/bin";
#else
#  echo "Le dossier output/llama.cpp/bin est absent";
#  exit;
#fi

# =================================================================================================
# Suppression du service #
# ====================== #
#LLAMA_SYSTEMD_DISABLED;
#LLAMA_SYSTEMD_DEL;


echo "Fin de la désinstallation";
