########################################################################################################################
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
if [ -d "$WORKDIR/src/llama.cpp" ]; then
  cd "$WORKDIR/src/llama.cpp"
  cmake -B build -DGGML_CUDA=ON
else
 echo "La fonction LLAMA_BUILD_01 est en erreur";
fi
}
LLAMA_BUILD_02(){
if [ -d "$WORKDIR/src/llama.cpp" ]; then
  cd "$WORKDIR/src/llama.cpp"
  cmake --build build --config Release -j $BUILD_CPUS;
else
 echo "La fonction LLAMA_BUILD_02 est en erreur";
fi
}


########################################################################################################################
# Déplacement de la Source vers output #
########################################
LLAMA_BUILD_MV_BIN(){
if [ ! -d "$WORKDIR/output/llama.cpp" ]; then
 mkdir    "$WORKDIR/output/llama.cpp";
 mv       "$WORKDIR/llama.cpp/build/bin/*" "$WORKDIR/output/llama.cpp"
fi
}

