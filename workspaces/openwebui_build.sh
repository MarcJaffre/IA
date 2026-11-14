#!/usr/bin/bash

# =============================================================================================
# Arrête le script immédiatement en cas d'erreur #
# ============================================== #
set -e

# =============================================================================================
# Global.conf #
# =========== #
# Si fichier absent, je le copie
if [ ! -f "./globale.conf" ]; then
 cp "./globale.conf.exemple" "./globale.conf";
else
 echo "Fichier globale.conf présent";
fi

# =================================================================================================
# Configuration du WORKDIR #
# ======================== #
if [ -f "./globale.conf" ]; then
  sed -i -e "s|^WORKDIR\=.*|WORKDIR=\"$(pwd)\"|g" "./globale.conf";
  cat "./globale.conf"
fi

# =============================================================================================

