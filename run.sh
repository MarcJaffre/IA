#!/usr/bin/bash
# =================================================================================================
# Arrête le script immédiatement en cas d'erreur #
# ============================================== #
set -e

# =================================================================================================
# Chargement de la configuration du WORKDIR #
# ========================================= #
if [ -f "./globale.conf" ]; then
  source "./globale.conf";
else
  echo "Le fichier globale.conf n'existe pas";
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
# Edition des permissions lancement #
# ================================= #
if [ $(pwd) = "$WORKDIR/output/llama.cpp/bin" ]; then
  find . -type f -iname "llama*" -exec chmod +x {} \;
else
  echo "Le dossier output/llama.cpp/bin est absent";
  exit;
fi



# =================================================================================================
# Lancement de l'application llama #
# ================================ #
if [ $(pwd) = "$WORKDIR/output/llama.cpp/bin" ]; then
  ./llama-server --host "0.0.0.0" --port "8080" --api-key admin
else
  echo "Le dossier output/llama.cpp/bin est absent";
  exit;
fi
