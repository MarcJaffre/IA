#====================================================================================
# Dossier de Travail #
# ================== #
OPENWEBUI_MAKE_DIR(){
# ----------------------------------------------------------
echo "Création des dossiers Openwebui, Download et Cache";
# ----------------------------------------------------------
if [ ! -d  "./openwebui" ]; then
  mkdir -p "./openwebui";
  cd       "./openwebui";
else
  cd       "./openwebui";
fi
# ----------------------------------------------------------
if [ !  -d "./openwebui/download" ]; then
  mkdir -p "./openwebui/download";
fi

# ----------------------------------------------------------
if [ ! -d "./openwebui/.cache" ]; then
  mkdir -p "./openwebui/.cache";
fi
# ----------------------------------------------------------
echo "Création de l'environnement Virtuel";
if [ -d "./openwebui" ]; then
  python$PYTHON_VERSION -m venv "$ENV_NAME"
fi
}


#$PROJET_DIR
#$PYTHON_PACKAGE
#$PYTHON_VERSION
#$ENV_NAME
#$PIP_DOWNLOAD_DIR
#$XDG_CACHE_HOME
