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






MESSAGE_TOP;
MESSAGE_LOADING_GLOBAL;

# =================================================================================================
# Dossier Source #
# ============== #
MESSAGE_LLAMA_PURGE_SRC; # 1
LLAMA_PURGE_DIR_SRC;

# =================================================================================================
# Dossier Output #
# ============== #
MESSAGE_LLAMA_PURGE_OUTPUT;
LLAMA_PURGE_DIR_OUTPUT;

# =================================================================================================
# Telecharger Depots LLAMA #
# ======================== #
MESSAGE_LLAMA_GIT_CLONE;
LLAMA_GIT_CLONE;

# =================================================================================================
# Configuration de la build #
# ========================= #
MESSAGE_LLAMA_CONFIG_BUILD;
LLAMA_BUILD_CONFIG;

# =================================================================================================
# Compilation de la build #
# ======================= #
MESSAGE_LLAMA_MAKE_BUILD
LLAMA_BUILD_MAKE;

# =================================================================================================
# Installer la build dans Output #
# ============================== #
MESSAGE_LLAMA_BUILD_OUTPUT;
LLAMA_BUILD_INSTALL;

# =================================================================================================
# Message de fin #
##################
MESSAGE_LLAMA_END;
MESSAGE_BOT;


