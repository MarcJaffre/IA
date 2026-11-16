#!/usr/bin/bash
# =================================================================================================
# Arrête le script immédiatement en cas d'erreur #
# ============================================== #
set -e

# =================================================================================================
# Charger fichier Debian #
# ====================== #
if [ -f  ./IA/functions/999_packages.sh ]; then
  source ./IA/functions/999_packages.sh;
fi

# =================================================================================================
# Charger fichier Debian #
# ====================== #
if [ -f /etc/os-release ]; then
  source /etc/os-release;
fi

# =================================================================================================
if [ $ID = debian ]; then
 # ------------------------------------------- #
 HOST_DEBIAN_APT_REPO               1>/dev/null;
 echo "";
 # ------------------------------------------- #
 HOST_DEBIAN_APT_UPDATE;
 HOST_DEBIAN_APT_UPGRADE;
 HOST_DEBIAN_APT_INSTALL_BASE;
 # ------------------------------------------- #
 HOST_DEBIAN_APT_INSTALL_DEPENDANCE;
 # ------------------------------------------- #
 #HOST_DEBIAN_BLACKLIST_NOUVEAU;
 # ------------------------------------------- #
 #HOST_DEBIAN_NVIDIA;
 # ------------------------------------------- #
 #HOST_DEBIAN_NVIDIA_CUDA;
 #echo "--------------------------------------";
else
 echo "Ce projet est conçus exclusivement pour Debian."
 echo "Le fichier des dépendances se trouve IA/functions/999_package.sh";
fi
