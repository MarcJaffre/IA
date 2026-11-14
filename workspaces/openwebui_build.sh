#!/usr/bin/bash

# =============================================================================================
# Arrête le script immédiatement en cas d'erreur #
# ============================================== #
set -e

# =============================================================================================
# Global.conf #
# =========== #

# ========================================================================================
# SI fichier absent (copie, édite et charge le fichier)
if [ ! -f "./globale.conf" ]; then
     cp "./globale.conf.exemple" "./globale.conf";
     sed -i -e "s|^WORKDIR\=.*|WORKDIR=\"$(pwd)\"|g" "./globale.conf";
     source "./globale.conf";
     echo "$WORKDIR";
# ========================================================================================
# SI fichier présent (édite et charge le fichier)
elif [ -f "./globale.conf" ]; then
     sed -i -e "s|^WORKDIR\=.*|WORKDIR=\"$(pwd)\"|g" "./globale.conf";
     source "./globale.conf";
     echo "$WORKDIR";
fi
# ========================================================================================


# =============================================================================================
# WORKDIR - DISPONIBLE #
# ==================== #
