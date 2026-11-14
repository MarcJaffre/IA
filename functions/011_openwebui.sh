#====================================================================================
# Dossier de Travail #
# ================== #
OPENWEBUI_MAKE_DIR(){
# ----------------------------------------------------------
echo "Création des dossiers Openwebui, Download et Cache";
if [ ! -d "$WORKDIR/IA/openwebui" ]; then
 mkdir -p "$WORKDIR/IA/openwebui";
else
 echo "KO 1";
fi
# ----------------------------------------------------------
if [ ! -d "$WORKDIR/IA/openwebui/download" ]; then
 mkdir -p "$WORKDIR/IA/openwebui/download";
else
 echo "KO 2";
fi

# ----------------------------------------------------------
if [ ! -d "$WORKDIR/IA/openwebui/.cache" ]; then
 mkdir -p "$WORKDIR/IA/openwebui/.cache";
else
 echo "KO 3";
fi
# ----------------------------------------------------------
}

# ====================================================================================
# Build Projet #
# ============ #
py -%PYTHON_VERSION% -m venv "%ENV_NAME%"




#$PROJET_DIR
#$PYTHON_PACKAGE
#$PYTHON_VERSION
#$ENV_NAME
#$PIP_DOWNLOAD_DIR
#$XDG_CACHE_HOME
