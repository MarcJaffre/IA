# ============================================================================================================================================================
# Vérification et chargement du fichier Configuration #
# =================================================== #
CHECK_CONFIG_EXIST(){
if [ -f   "$CONFIG_FILE" 1>/dev/null ]; then
   source "$CONFIG_FILE";
else
  echo "Erreur : Le fichier $CONFIG_FILE est introuvable."; 
  exit 1;
fi
}
# ============================================================================================================================================================
# Dossier de Travail #
# ================== #
CHECK_WORKDIR_EXIST(){
if [ ! -d "$WORKDIR" ]; then
 mkdir -p "$WORKDIR";
 cd       "$WORKDIR";
fi
}
