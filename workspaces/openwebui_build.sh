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
