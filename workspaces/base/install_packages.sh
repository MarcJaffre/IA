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
 # ----------------------------------------- #
 HOST_DEBIAN_APT_REPO;
 echo "";
 # ----------------------------------------- #
 HOST_DEBIAN_APT_UPDATE;
 echo "";
 HOST_DEBIAN_APT_UPGRADE;
 echo "";
 # ----------------------------------------- #
 HOST_DEBIAN_APT_INSTALL_BASE;
 echo "";
 # ----------------------------------------- #
 #HOST_DEBIAN_APT_INSTALL_DEPENDANCE;
 #echo "";
 # ----------------------------------------- #
 #HOST_DEBIAN_BLACKLIST_NOUVEAU;
 # ----------------------------------------- #
 #HOST_DEBIAN_NVIDIA;
 # ----------------------------------------- #
 #HOST_DEBIAN_NVIDIA_CUDA;
 #echo "------------------------------------"
else
 echo "Ce projet est conçus exclusivement pour Debian."
 echo "Le fichier des dépendances se trouve IA/functions/999_package.sh";
fi
