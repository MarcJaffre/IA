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
if [ ! -d "$WORKDIR/src/llama.cpp" ]; then
  git clone --quiet "$GITHUB_LLAMA" "$WORKDIR/src/llama.cpp";
else
  echo "La fonction LLAMA_GIT_CLONE est en erreur ou lancer LLAMA_PURGE_DIR avant.";
fi
}

########################################################################################################################
# Compilation du projet #
#########################
LLAMA_BUILD_01(){
if [ -d "$WORKDIR/src/llama.cpp" ]; then
  cd    "$WORKDIR/src/llama.cpp";
  cmake -B build $CMAKE_ARGS --log-level=ERROR > /dev/null;
  # cmake -B build -DGGML_CUDA=ON -DLLAMA_OPENSSL=OFF --log-level=ERROR > /dev/null;
else
  echo "La fonction LLAMA_BUILD_01 est en erreur";
fi
}
LLAMA_BUILD_02(){
if [ -d "$WORKDIR/src/llama.cpp" ]; then
  cd    "$WORKDIR/src/llama.cpp";
  cmake --build build --config Release -j "$BUILD_CPUS" > /dev/null;
else
  echo "La fonction LLAMA_BUILD_02 est en erreur";
fi
}


########################################################################################################################
# Déplacement de la Source vers output #
########################################
LLAMA_BUILD_MV_BIN(){
if [ ! -d "$WORKDIR/output/llama.cpp" ]; then
  # ============================================
  cd      "$WORKDIR/src/llama.cpp/build/bin/"
  # ============================================
  mkdir   "$WORKDIR/output/llama.cpp";
  mv *    "$WORKDIR/output/llama.cpp";
  # ============================================
else
  echo "Le script est en erreur ls $WORKDIR/output/llama.cpp)";
fi
}

########################################################################################################################
# Déplacement de la Source vers output #
########################################
LLAMA_BUILD_MV_BIN2(){
if [ ! -d "$WORKDIR/output/llama.cpp" ]; then
  # ===================================================================
  cd      "$WORKDIR/src/llama.cpp/build/bin/"
  # ===================================================================
  mkdir   "/root/llama.cpp";
  mv *    "/root/llama.cpp";
  # ===================================================================
  find "/root/llama.cpp" -type f -iname "llama*" -exec chmod +x {} \;
  # ===================================================================
fi
}


########################################################################################################################
# Lancement pour démonstration #
################################
LLAMA_RUN_APPZ(){
cd "$WORKDIR/output/llama.cpp";
echo "";
find . -type f -iname "llama*" -exec chmod +x {} \;
./llama-server --host "0.0.0.0" --port "3000"
}
