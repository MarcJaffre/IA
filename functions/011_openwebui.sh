#====================================================================================
# Nettoyage du dossier de l'application #
# ===================================== #
OPENWEBUI_PURGE_FOLDER(){
if [ -d "$WORKDIR/openwebui" ]; then
 echo "Suppression du dossier $WORKDIR/openwebui";
 rm -rf "$WORKDIR/openwebui";
else
 echo "Dossier $WORKDIR/openwebui absent";
fi
}
#====================================================================================
# Création du dossier de l'application #
# ==================================== #
OPENWEBUI_MAKE_FOLDER(){
if [ ! -d "$WORKDIR/openwebui" ]; then
 echo "Création du dossier $WORKDIR/openwebui";
 mkdir    "$WORKDIR/openwebui";
else
 echo "Dossier $WORKDIR/openwebui déjà crée";
fi
}






#$PROJET_DIR
#$PYTHON_PACKAGE
#$PYTHON_VERSION
#$ENV_NAME
#$PIP_DOWNLOAD_DIR
#$XDG_CACHE_HOME
