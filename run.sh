#!/usr/bin/bash
# =================================================================================================
# Arrête le script immédiatement en cas d'erreur #
# ============================================== #
set -e

# =================================================================================================
# Chargement de la configuration du WORKDIR #
# ========================================= #
if [ -f globale.conf ]; then
 source globale.conf;
fi

# =================================================================================================
# Dossier output llama #
# ==================== #
if [ -d "$WORKDIR/output/llama.cpp" ]; then
  cd    "$WORKDIR/output/llama.cpp"  ;
else
  echo "Le dossier output/llama.cpp est absent"; 
  exit;
fi

# =================================================================================================
# Mise en executable des binaires #
# =============================== #
find . -type f -iname "llama*" -exec chmod +x {} \;

# =================================================================================================
# Lancement du serveur #
# ==================== #
./llama-server --host "0.0.0.0" --port "8080" --api-key admin
