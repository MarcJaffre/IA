e########################################################################################################################
# Creation du Dossier LLAMA #
#############################
LLAMA_PURGE_DIR(){
if [ -d  "$WORKDIR/src/llama.cpp" ]; then 
  rm -rf "$WORKDIR/src/llama.cpp";
fi
}

########################################################################################################################
LLAMA_GIT_CLONE(){
git clone --quiet https://github.com/ggerganov/llama.cpp.git "$WORKDIR/llama.cpp";
}

########################################################################################################################
# Compilation du projet #
#########################
LLAMA_BUILD_01(){
cd "$WORKDIR/src/llama.cpp"
cmake -B build -DGGML_CUDA=ON
}
LLAMA_BUILD_02(){
cd "$WORKDIR/src/llama.cpp"
cmake --build build --config Release -j $BUILD_CPUS;
}


########################################################################################################################
# Déplacement de la Source vers output #
########################################
LLAMA_BUILD_MV_BIN(){
if [ ! -d "$WORKDIR/output/llama.cpp" ]; then
 mkdir    "$WORKDIR/output/llama.cpp";
 mv       "$WORKDIR/llama.cpp/build/bin/*" "$WORKDIR/output/llama.cpp"
}

