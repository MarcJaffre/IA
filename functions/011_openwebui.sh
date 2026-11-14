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
# ====================== #
OPENWEBUI_CREATE_DIR(){
if [ ! -d "$WORKDIR/IA/openwebui" ]; then
 echo "Dossier à créer";
 echo mkdir "$WORKDIR/IA/openwebui";
 echo mkdir "$WORKDIR/IA/openwebui/download";
 echo mkdir "$WORKDIR/IA/openwebui/.cache";
fi
}
#====================================================================================
# Dosser Environnement #
# ====================== #
OPENWEBUI_CREATE_DIR(){
if [ -d "$WORKDIR/IA/openwebui" ]; then
 cd $WORKDIR/IA/openwebui;
fi
}




#$PROJET_DIR
#$PYTHON_PACKAGE
#$PYTHON_VERSION
#$ENV_NAME
#$PIP_DOWNLOAD_DIR
#$XDG_CACHE_HOME
