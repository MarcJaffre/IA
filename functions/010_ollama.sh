########################################################################################################################
# Creation du Dossier LLAMA #
#############################
LLAMA_MAKE_DIR(){
if [ -d  "$WORKDIR\llama.cpp" ]; then 
  rm -rf "$WORKDIR\llama.cpp" 2>/dev/null;
else
 mkdir -p "$WORKDIR\llama.cpp";
fi
}

########################################################################################################################
LLAMA_GIT_CLONE(){
git clone https://github.com/ggerganov/llama.cpp.git "$WORKDIR\src\llama.cpp";
}

########################################################################################################################
# Compilation du projet #
#########################
LLAMA_BUILD_01(){
cd "$WORKDIR\src\llama.cpp"
cmake -B build -DGGML_CUDA=ON
}
LLAMA_BUILD_02(){
cd "$WORKDIR\src\llama.cpp"
cmake --build build --config Release -j $BUILD_CPUS;
}

