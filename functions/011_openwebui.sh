##########################################################################################
# Dossier de Travail #
######################
OPENWEBUI_MAKE_DIR(){
if [ ! -d "$WORKDIR/IA/openwebui" ]; then
 mkdir -p "$WORKDIR/IA/openwebui";
fi

if [ ! -d "$WORKDIR/IA/openwebui/download" ]; then
 mkdir -p "$WORKDIR/IA/openwebui/download";
fi

if [ ! -d "$WORKDIR/IA/openwebui/.cache" ]; ten
 mkdir -p "$WORKDIR/IA/openwebui/.cache";
fi
}




#$PROJET_DIR
#$PYTHON_PACKAGE
#$PYTHON_VERSION
#$ENV_NAME
#$PIP_DOWNLOAD_DIR
#$XDG_CACHE_HOME
