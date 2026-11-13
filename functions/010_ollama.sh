###########################################################################################
# Creation du Dossier LLAMA
func_llama_dir(){
if [ -d  "$WORKDIR\llama.cpp" ]; then 
  rm -rf "$WORKDIR\llama.cpp" 2>/dev/null;
fi
}
