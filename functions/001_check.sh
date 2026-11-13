
# ===========================================================================================================
# Dossier de Travail #
# ================== #
CHECK_WORKDIR_EXIST(){
if [ ! -d "$WORKDIR" ]; then
 mkdir -p "$WORKDIR";
 cd       "$WORKDIR";
 tree -D 1;
fi
}
