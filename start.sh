#!/usr/bin/bash

# =========================================================================================
# Arrête le script immédiatement en cas d'erreur #
# ============================================== #
set -e

# # =========================================================================================
# Nettoyage Console #
# ================= #
clear;

# =========================================================================================
# Vérification et chargement du fichier Configuration #
# =================================================== #
if [ -f   "./globale.conf" 1>/dev/null ]; then
   #echo "Chargement de Globale.conf";
   source "./globale.conf";
else
  echo "Erreur : Le fichier /globale.conf est introuvable.";
  exit 1;
fi

# =========================================================================================
# Fonctions qui sont Opérationnelles #
# ================================== #
# ---------------------------------------
#HOST_DEBIAN_APT_UPDATE 1>/dev/null;
#HOST_DEBIAN_APT_INSTALL_DEPENDANCE;
# ---------------------------------------
clear;
#MESSAGE_TOP;
# ---------------------------------------
#MESSAGE_LOADING_GLOBAL;
#HOST_DEBIAN_BLACKLIST_NOUVEAU;
#HOST_DEBIAN_NVIDIA;
#HOST_DEBIAN_NVIDIA_CUDA;
# ---------------------------------------
#MESSAGE_LLAMA_PURGE_SRC;    # OK
#LLAMA_PURGE_DIR_SRC;        # OK
# ---------------------------------------
#MESSAGE_LLAMA_GIT_CLONE;    # OK
#LLAMA_GIT_CLONE;            # OK
# ---------------------------------------
#MESSAGE_LLAMA_PURGE_OUTPUT; # OK
#LLAMA_PURGE_DIR_OUTPUT;     # OK
# ---------------------------------------
#MESSAGE_LLAMA_BUILD;        # OK
#LLAMA_BUILD_01;             # ??
LLAMA_BUILD_02;             # ??



# ---------------------------------------
#MESSAGE_LLAMA_END;
#LLAMA_BUILD_MV_BIN;
# ---------------------------------------
#MESSAGE_BOT;
#echo "";
#LLAMA_SYSTEMD_ADD
#LLAMA_SYSTEMD_ENABLED
#LLAMA_SYSTEMD_DISABLED
#LLAMA_SYSTEMD_DEL


# read -p "Voulez-vous continer ? (o/n) : "  -n 1 -r
