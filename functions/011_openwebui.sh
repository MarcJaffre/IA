# ====================================================================================
# Nettoyage du dossier de l'application #
# ===================================== #
OPENWEBUI_PURGE_FOLDER(){
if [ -d "$WORKDIR/openwebui" ]; then
 rm -rf "$WORKDIR/openwebui"  ;
fi
}
# ====================================================================================
# Création du dossier de l'application #
# ==================================== #
OPENWEBUI_MAKE_FOLDER(){
if [ ! -d "$WORKDIR/openwebui" ]; then
 mkdir    "$WORKDIR/openwebui"  ;
fi
}

# ====================================================================================
# Creation Environnement Virtuel #
# ============================== #
OPENWEBUI_PYTHON_MAKE_ENV(){
if [ -d "$WORKDIR/openwebui" ]; then
   cd   "$WORKDIR/openwebui";
   python${PYTHON_VERSION} -m venv "$ENV_NAME"
fi
}
# ====================================================================================
# Charger l'Environnement Virtuel #
# =============================== #
# Check: echo "$VIRTUAL_ENV"
OPENWEBUI_PYTHON_LOAD_ENV(){
if [ -d   "$WORKDIR/openwebui" ]; then
   cd     "$WORKDIR/openwebui";
   source "$ENV_NAME/bin/activate";
fi
} 

OPENWEBUI_PYTHON_PIP_PACKAGE(){
if [ -d   "$WORKDIR/openwebui" ]; then
   cd     "$WORKDIR/openwebui";
   pip install --no-cache-dir -U "$PACKAGE"  --cache-dir "$PIP_DOWNLOAD_DIR";
fi
}



#$PROJET_DIR
#$PYTHON_PACKAGE
#$PYTHON_VERSION
#$ENV_NAME
#$PIP_DOWNLOAD_DIR
#$XDG_CACHE_HOME
