#!/usr/bin/bash
# =================================================================================================
# Arrête le script immédiatement en cas d'erreur #
# ============================================== #
set -e


# =================================================================================================
# Charger fichier Debian #
# ====================== #
if [ -f  $WORKDIR/IA/functions/999_packages.sh ]; then
  source $WORKDIR/IA/functions/999_packages.sh;
fi

cat $WORKDIR/IA/functions/999_packages.sh

# =================================================================================================
# Charger fichier Debian #
# ====================== #
if [ -f /etc/os-release ]; then
  source /etc/os-release;
fi

# =================================================================================================
if [ $ID = Debian ]; then
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

