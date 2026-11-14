#!/usr/bin/bash

# =========================================================================================
# Arrête le script immédiatement en cas d'erreur #
# ============================================== #
set -e

# =================================================================================================
# Configuration du WORKDIR #
# ======================== #
if [ -f globale.conf ]; then
  sed -i -e "s|^WORKDIR\=.*|WORKDIR=\"$(pwd)\"|g" globale.conf;
fi
# =================================================================================================
# Chargement de la configuration #
# ============================== #
source ./globale.conf;

# =================================================================================================
# llama #
# ===== #




# =========================================================================================
# Fonctions qui sont Opérationnelles #
# ================================== #
# ---------------------------------------
#HOST_DEBIAN_APT_UPDATE 1>/dev/null;
#HOST_DEBIAN_APT_INSTALL_DEPENDANCE;
# ---------------------------------------
MESSAGE_TOP;                   # Phase X
# ---------------------------------------
MESSAGE_LOADING_GLOBAL;        # Phase 0
#HOST_DEBIAN_BLACKLIST_NOUVEAU;
#HOST_DEBIAN_NVIDIA;
#HOST_DEBIAN_NVIDIA_CUDA;
# ---------------------------------------
# Phase 1
MESSAGE_LLAMA_PURGE_SRC;       # 
LLAMA_PURGE_DIR_SRC;           # OK
# ---------------------------------------
# Phase 2
MESSAGE_LLAMA_GIT_CLONE;       # 
LLAMA_GIT_CLONE;               # OK
# ---------------------------------------
# Phase 3
MESSAGE_LLAMA_PURGE_OUTPUT;    # 
LLAMA_PURGE_DIR_OUTPUT;        # OK
# ---------------------------------------
# Phase 4
MESSAGE_LLAMA_CONFIG_BUILD;    # 
LLAMA_CONFIG_BUILD;            # ??
# ---------------------------------------
# Phase 5
MESSAGE_LLAMA_MAKE_BUILD;      # 
LLAMA_MAKE_BUILD;              # ??
# ---------------------------------------
# Phase 6
MESSAGE_LLAMA_BUILD_OUTPUT;    #
LLAMA_BUILD_OUTPUT;            # 
# ---------------------------------------
# Phase 7
#MESSAGE_LLAMA_END;
#LLAMA_BUILD_MV_BIN;
# ---------------------------------------
#MESSAGE_BOT;
#echo "";
#LLAMA_SYSTEMD_ADD
#LLAMA_SYSTEMD_ENABLED
#LLAMA_SYSTEMD_DISABLED
#LLAMA_SYSTEMD_DEL
