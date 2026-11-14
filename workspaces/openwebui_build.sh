#!/usr/bin/bash

# =============================================================================================
# Arrête le script immédiatement en cas d'erreur #
# ============================================== #
set -e

# =============================================================================================
# Global.conf #
# =========== #
if [ ! -f ./globale.conf ]; then
 cp ./globale.conf.exemple ./globale.conf;
else
 echo "Fichier globale.conf présent";
fi
