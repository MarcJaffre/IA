#!/usr/bin/bash
# =============================================================================================================
# Arrête le script immédiatement en cas d'erreur #
# ============================================== #
set -e


# =============================================================================================================
# Définir la variable WORKDIR #
# =========================== #
if [[ "$PWD" != *IA* ]]; then
 WORKDIR=$PWD/IA
 export WORKDIR=${WORKDIR};
fi
# =============================================================================================================
# Charger les fichiers de  Configuration #
# ====================================== #
if [ -f ${WORKDIR}/config/globale.conf ]; then
  # ===========================================================================================================
  source ${WORKDIR}/config/globale.conf;
  # ===========================================================================================================
  for file in $(find $WORKDIR/config    -type f -name "*.conf" ! -name globale.conf); do source $file; done
  for file in $(find $WORKDIR/functions -type f -name "*.sh");                        do source $file; done
  # ===========================================================================================================
fi
# =============================================================================================================
# Nettoyage Console #
# ================= #
clear;




# =============================================================================================================
# Dossier output llama #
# ==================== #
if [ -d "$WORKDIR/output/llama.cpp/bin" ]; then
  cd    "$WORKDIR/output/llama.cpp/bin";
else
  echo "Le dossier output/llama.cpp/bin est absent";
  exit;
fi

# =============================================================================================================
# Edition des permissions lancement #
# ================================= #
if [ $(pwd) = "$WORKDIR/output/llama.cpp/bin" ]; then
  find . -type f -iname "llama*" -exec chmod +x {} \;
else
  echo "Le dossier output/llama.cpp/bin est absent";
  exit;
fi

# =============================================================================================================
# Téléchargement de Modèle #
# ======================== #
if [ $(pwd) = "$WORKDIR/output/llama.cpp/bin" ]; then
# -----------------------------------------------------------------------------
   for MODEL in $LISTES_MODELES; do 
     echo "Téléchargement du modèle $MODEL";
     $WORKDIR/output/llama.cpp/bin/llama download -hf $MODEL 1>/dev/null;
   done
# -----------------------------------------------------------------------------
else
  echo "Le dossier output/llama.cpp/bin est absent";
  exit;
fi

# =============================================================================================================
# Lancement de l'application llama #
# ================================ #
if [ $(pwd) = "$WORKDIR/output/llama.cpp/bin" ]; then
  ./llama-server --host "0.0.0.0" --port "8080" --api-key admin
else
  echo "Le dossier output/llama.cpp/bin est absent";
  exit;
fi
# =============================================================================================================
