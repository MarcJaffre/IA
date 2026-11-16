#!/usr/bin/bash

# =================================================================================================
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
# Création du service #
# =================== #
LLAMA_SYSTEMD_ADD;
LLAMA_SYSTEMD_ENABLED;

cat  /etc/systemd/system/llama-server.service;

echo "Fin de l'installation du service;"
