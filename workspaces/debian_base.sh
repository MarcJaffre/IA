#!/usr/bin/bash
# =================================================================================================
# Arrête le script immédiatement en cas d'erreur #
# ============================================== #
set -e

# =================================================================================================
# Générer le fichier  #
# =================== #
# Github rester globale.conf.exemple mais pas globale.conf
if [ ! -f globale.conf ]; then 
 cp globale.conf.exemple globale.conf;
fi

# =================================================================================================
# Configuration du WORKDIR #
# ======================== #
if [ -f globale.conf ]; then
  sed -i -e "s|^WORKDIR\=.*|WORKDIR=\"$(pwd)\"|g" globale.conf;
fi

# =================================================================================================
# Chargement de la configuration du WORKDIR #
# ========================================= #
if [ -f "./globale.conf" ]; then
  source "./globale.conf";
else
  echo "Le fichier globale.conf n'existe pas";
fi



# =================================================================================================
# Charger fichier Debian #
# ====================== #
if [ -f /etc/os-release ]; then
  source /etc/os-release;
fi

# =================================================================================================
if [ $ID = debian ]; then
 HOST_DEBIAN_APT_REPO;
 HOST_DEBIAN_APT_UPDATE;
 HOST_DEBIAN_APT_INSTALL_DEPENDANCE;
 HOST_DEBIAN_BLACKLIST_NOUVEAU;
 HOST_DEBIAN_NVIDIA;
 HOST_DEBIAN_NVIDIA_CUDA;
else
 echo "Ce projet est conçus exclusivement pour Debian."
 echo "Le fichier des dépendances se trouve IA/functions/999_package.sh";
fi

