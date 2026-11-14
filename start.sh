#!/usr/bin/bash

# =========================================================================================
# Arrête le script immédiatement en cas d'erreur #
# ============================================== #
set -e

# =========================================================================================
# Nettoyage Console #
# ================= #
clear;

# =========================================================================================
# Vérification et chargement du fichier Configuration #
# =================================================== #
if [ -f   "./globale.conf" 1>/dev/null ]; then
   echo "Chargement de Globale.conf";
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
#MESSAGE_TOP;                   # Phase X
# ---------------------------------------
#MESSAGE_LOADING_GLOBAL;        # Phase 0
#HOST_DEBIAN_BLACKLIST_NOUVEAU;
#HOST_DEBIAN_NVIDIA;
#HOST_DEBIAN_NVIDIA_CUDA;
# ---------------------------------------
# Phase 1
#MESSAGE_LLAMA_PURGE_SRC;       # 
#LLAMA_PURGE_DIR_SRC;           # OK
# ---------------------------------------
# Phase 2
#MESSAGE_LLAMA_GIT_CLONE;       # 
#LLAMA_GIT_CLONE;               # OK
# ---------------------------------------
# Phase 3
#MESSAGE_LLAMA_PURGE_OUTPUT;    # 
#LLAMA_PURGE_DIR_OUTPUT;        # OK
# ---------------------------------------
# Phase 4
#MESSAGE_LLAMA_CONFIG_BUILD;    # 
#LLAMA_CONFIG_BUILD;            # ??
# ---------------------------------------
# Phase 5
#MESSAGE_LLAMA_MAKE_BUILD;      # 
#LLAMA_MAKE_BUILD;              # ??
# ---------------------------------------
# Phase 6
#read -p "Voulez-vous continer ? (o/n) : "  -n 1 -r
#MESSAGE_LLAMA_BUILD_OUTPUT;    #
#read -p "Voulez-vous continer ? (o/n) : "  -n 1 -r
#LLAMA_BUILD_OUTPUT;            # 
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
# =========================================================================================
# read -p "Voulez-vous continer ? (o/n) : "  -n 1 -r
