#!/usr/bin/bash

# =============================================================================================
# Arrête le script immédiatement en cas d'erreur #
# ============================================== #
set -e

# =============================================================================================
# Global.conf #
# =========== #
# -------------------------------------------------------------------------
# Si fichier absent
if [ ! -f "./config/globale.conf" ]; then
     cp "./config/globale.conf.exemple" "./config/globale.conf";
     sed -i -e "s|^WORKDIR\=.*|WORKDIR=\"$(pwd)\"|g" "./config/globale.conf";
     source "./globale.conf";
# -------------------------------------------------------------------------
# SI fichier présent 
elif [ -f "./config/globale.conf" ]; then
     sed -i -e "s|^WORKDIR\=.*|WORKDIR=\"$(pwd)\"|g" "./config/globale.conf";
     source "./config/globale.conf";
fi
# -------------------------------------------------------------------------

# =============================================================================================
# Lancement du script #
#######################

echo $WORKDIR

OPENWEBUI_PURGE_FOLDER;

OPENWEBUI_MAKE_FOLDER;

OPENWEBUI_PYTHON_MAKE_ENV;

OPENWEBUI_PYTHON_LOAD_ENV

echo $WORKDIR
OPENWEBUI_PYTHON_PIP_PACKAGE
