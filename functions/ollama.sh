###########################################################################################
func_llama_dir(){
echo Phase 1 - Dossier de Parent
if [ -d  "$WORKDIR\llama.cpp" ]; then 
  rm -rf "$WORKDIR\llama.cpp" 2>/dev/null;
fi
}
