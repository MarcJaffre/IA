#====================================================================================
# Dossier de Travail #
# ================== #
OPENWEBUI_PURGE(){
if [ -d "$WORKDIR/IA/openwebui" ]; then
 echo "Dossier à delete";
fi
}
#====================================================================================
# Création Environnement #
##########################
OPENWEBUI_CREATE_DIR(){
if [ ! -d "$WORKDIR/IA/openwebui" ]; then
 echo "Dossier à delete";
fi
}



#$PROJET_DIR
#$PYTHON_PACKAGE
#$PYTHON_VERSION
#$ENV_NAME
#$PIP_DOWNLOAD_DIR
#$XDG_CACHE_HOME
