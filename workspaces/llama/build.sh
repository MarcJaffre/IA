#!/usr/bin/bash

# =============================================================================================================
# Arrête le script immédiatement en cas d'erreur #
# ============================================== #
set -e

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

    echo "Dossier de travail Tempo : $WORKDIR";
    echo "Dossier de Travail Final : $WORKDIR_FINAL";
    echo "Test du fichier Openwebui: $PYTHON_PACKAGE";


# =============================================================================================================
# Messages de présentation #
# ======================== #
#MESSAGE_TOP;
#MESSAGE_OLD_TOP;
#MESSAGE_LOADING_GLOBAL;

# =============================================================================================================
# Dossier Source #
# ============== #
#MESSAGE_LLAMA_PURGE_SRC;
#LLAMA_PURGE_DIR_SRC;

# =============================================================================================================
# Dossier Output #
# ============== #
#MESSAGE_LLAMA_PURGE_OUTPUT;
#LLAMA_PURGE_DIR_OUTPUT;

# =============================================================================================================
# Telecharger Depots LLAMA #
# ======================== #
#MESSAGE_LLAMA_GIT_CLONE;
#LLAMA_GIT_CLONE;

# =============================================================================================================
# Configuration de la build #
# ========================= #
#MESSAGE_LLAMA_CONFIG_BUILD;
#LLAMA_BUILD_CONFIG;

# =============================================================================================================
# Compilation de la build #
# ======================= #
#MESSAGE_LLAMA_MAKE_BUILD;
#LLAMA_BUILD_MAKE;

# =============================================================================================================
# Installer la build dans Output #
# ============================== #
#MESSAGE_LLAMA_BUILD_OUTPUT;

#LLAMA_BUILD_INSTALL;      # {WORKDIR/output
#LLAMA_BUILD_INSTALL_FINAL; # $WORKDIR_FINAL/llama.cpp


# =============================================================================================================
# Message de fin #
##################
#MESSAGE_LLAMA_END;
#MESSAGE_BOT;

# =============================================================================================================
