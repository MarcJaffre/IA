#!/usr/bin/bash

# =============================================================================================
# Arrête le script immédiatement en cas d'erreur #
# ============================================== #
set -e

# =============================================================================================
# Lancement du script #
#######################
OPENWEBUI_PURGE_FOLDER
OPENWEBUI_MAKE_FOLDER
OPENWEBUI_PYTHON_MAKE_ENV
OPENWEBUI_PYTHON_LOAD_ENV
OPENWEBUI_PYTHON_PIP_PACKAGE
