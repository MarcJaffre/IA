#!/usr/bin/bash
# =================================================================================================
# Arrête le script immédiatement en cas d'erreur #
# ============================================== #
set -e

# =================================================================================================
# Paramétrage de ce script #
# ======================== #
RUN_LLAMA="1"

# =================================================================================================
# Chargement de la configuration du WORKDIR #
# ========================================= #
if [ -f globale.conf ]; then
 source globale.conf;
fi

# =================================================================================================
# Dossier output llama #
# ==================== #
if [ $RUN_LLAMA = "1" ]; then
      if [ -d "$WORKDIR/output/llama.cpp" ]; then
        cd    "$WORKDIR/output/llama.cpp"  ;
      else
        echo "Le dossier output/llama.cpp est absent"; 
        exit;
      fi
      find . -type f -iname "llama*" -exec chmod +x {} \;
      ./llama-server --host "0.0.0.0" --port "8080" --api-key admin
fi
