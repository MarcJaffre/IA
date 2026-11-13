########################################################################################################################
# Creation du Dossier LLAMA #
#############################
func_llama_dir(){
if [ -d  "$WORKDIR\llama.cpp" ]; then 
  rm -rf "$WORKDIR\llama.cpp" 2>/dev/null;
fi
}
########################################################################################################################
# Compilation du projet #
#########################
func_llama_build_01(){
cmake -B build -DGGML_CUDA=ON
}
func_llama_build_02(){
cmake --build build --config Release -j $BUILD_CPUS
}

