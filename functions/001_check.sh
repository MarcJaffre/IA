
# ===========================================================================================================
# Dossier de Travail #
# ================== #
CHECK_WORKDIR_EXIST(){
if [ !  -d "$WORKDIR" ]; then
  mkdir -p "$WORKDIR";
  cd       "$WORKDIR";
else
  rm   -rf "$WORKDIR";
  mkdir -p "$WORKDIR";
  cd       "$WORKDIR";
  touch    "$WORKDIR/Demo.txt";
  ls -la .;
fi
}


