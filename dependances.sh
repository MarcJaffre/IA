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

if [ -f /etc/os-release ];
  source /etc/os-release
fi

# =================================================================================================
if [ $ID = debian ]; then
 HOST_DEBIAN_APT_REPO;
 HOST_DEBIAN_APT_UPDATE;
 HOST_DEBIAN_APT_INSTALL_DEPENDANCE;
 HOST_DEBIAN_BLACKLIST_NOUVEAU;
 HOST_DEBIAN_NVIDIA;
 HOST_DEBIAN_NVIDIA_CUDA; 
fi

