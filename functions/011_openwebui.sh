#====================================================================================
# Dossier de Travail #
# ================== #
OPENWEBUI_MAKE_DIR(){
# ----------------------------------------------------------
echo "Création des dossiers Openwebui, Download et Cache";
# ----------------------------------------------------------
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
else
  echo "KO 2";
fi

# ----------------------------------------------------------
if [ ! -d "./openwebui/.cache" ]; then
  mkdir -p "./openwebui/.cache";
else
  echo "KO 3";
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
