#====================================================================================
# Nettoyage du dossier de l'application #
# ===================================== #
OPENWEBUI_PURGE_FOLDER(){
if [ -d "$WORKDIR/openwebui" ]; then
 rm -rf "$WORKDIR/openwebui";
fi
}
#====================================================================================
# Création du dossier de l'application #
# ==================================== #
OPENWEBUI_MAKE_FOLDER(){
if [ !  -d "$WORKDIR/openwebui" ]; then
 mkdir -rf "$WORKDIR/openwebui";
fi
}






#$PROJET_DIR
#$PYTHON_PACKAGE
#$PYTHON_VERSION
#$ENV_NAME
#$PIP_DOWNLOAD_DIR
#$XDG_CACHE_HOME
