########################################################################################################################
# Purge Dossier src et Output #
###############################
LLAMA_PURGE_DIR_SRC(){
if [ -d "$WORKDIR\src\llama.cpp" ]; then
  echo "LLAMA_PURGE_DIR_SRC";
  rm -f "$WORKDIR\src\llama.cpp";
else
 echo "$WORKDIR\src\llama.cpp";
fi
}
# --------------------------------------------------
LLAMA_PURGE_DIR_OUTPUT(){
if [ -d "$WORKDIR\output\llama.cpp" ]; then
  echo "LLAMA_PURGE_DIR_OUTPUT";
  rm -f "$WORKDIR\output\llama.cpp";
fi
}
########################################################################################################################
# Telecharger le depot LLAMA #
##############################
LLAMA_GIT_CLONE(){
if [ ! -d "$WORKDIR/src/llama.cpp" ]; then
  echo "LLAMA_GIT_CLONE";
  git clone --quiet "$GITHUB_LLAMA" "$WORKDIR/src/llama.cpp";
fi
}
########################################################################################################################
# Compilation du projet (1/2) #
###############################
LLAMA_BUILD_01(){
if [ -d "$WORKDIR/src/llama.cpp" ]; then
  echo "LLAMA_BUILD_01";
  cd    "$WORKDIR/src/llama.cpp";
  echo cmake -B build $CMAKE_ARGS --log-level=ERROR > /dev/null;
  # cmake -B build -DGGML_CUDA=ON -DLLAMA_OPENSSL=OFF --log-level=ERROR > /dev/null;
else
  echo "La fonction LLAMA_BUILD_01 est en erreur";
fi
}
########################################################################################################################
# Compilation du projet (2/2) #
###############################
LLAMA_BUILD_02(){
if [ -d "$WORKDIR/src/llama.cpp" ]; then
  cd    "$WORKDIR/src/llama.cpp";
  echo cmake --build build --config Release -j "$BUILD_CPUS" > /dev/null;
else
  echo "La fonction LLAMA_BUILD_02 est en erreur";
fi
}







########################################################################################################################
# Déplacement de la Source vers output #
########################################
LLAMA_BUILD_MV_BIN(){
if [ ! -d "$WORKDIR/output/llama.cpp" ]; then
  # =================================================================================
  echo "Déplacement des binaires llama.cpp";
  # =================================================================================
  cd      "$WORKDIR/src/llama.cpp/build/bin/"
  # =================================================================================
  mkdir   "$WORKDIR_FINAL/llama.cpp";
  mv *    "$WORKDIR_FINAL/llama.cpp";
  # =================================================================================
  find "$WORKDIR_FINAL/llama.cpp" -type f -iname "llama*" -exec chmod +x {} \;
  # =================================================================================
fi
}

########################################################################################################################
# Déplacement de la Source vers output #
########################################
LLAMA_BUILD_MV_BIN2(){
if [ ! -d "$WORKDIR/output/llama.cpp" ]; then
  # ============================================
  echo "Déplacement des binaires llama.cpp";
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
# Creation du Service #
#######################
LLAMA_SYSTEMD_ADD(){
# ==============================================================================
echo "Création du service llama-server.service";
# ==============================================================================
if [ -f /etc/systemd/system/llama-server.service ]; then
  rm -f /etc/systemd/system/llama-server.service;
fi
# ==============================================================================
cat > /etc/systemd/system/llama-server.service <<EOF
[Unit]
Description=llama.cpp HTTP server
After=network-online.target
Wants=network-online.target

[Service]
Type=simple
WorkingDirectory=$WORKDIR_FINAL/llama.cpp 
ExecStart=$WORKDIR_FINAL/llama.cpp/llama-server $LLAMA_SERVICE_OPTION
Restart=on-failure
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF

# ==============================================================================
systemctl daemon-reload;
}

########################################################################################################################
# Suppression du Service #
##########################
LLAMA_SYSTEMD_DEL(){
# Check fichier si il existe
if [ -f etc/systemd/system/llama-server.service ]; then
  # --------------------------------------------------------------------------------
  if [ $(systemctl is-enabled llama-server.service) == "enabled" ]; then
    echo "Désactivation du service llama-server";
    systemctl disable --now llama-server.service 2>/dev/null;
    systemctl daemon-reload;
  fi
  # --------------------------------------------------------------------------------
  echo "Suppression du service llama-server";
  rm -f /etc/systemd/system/llama-server.service;
  # --------------------------------------------------------------------------------
else
 echo "La fonction LLAMA_SYSTEMD_DEL est en anomalie";
fi
}


########################################################################################################################
# Activation du service #
#########################
LLAMA_SYSTEMD_ENABLED(){
if [ $(systemctl is-enabled llama-server.service) == "disabled" ]; then
  echo "Activation du service llama-server";
  systemctl daemon-reload;
  systemctl enable --now llama-server.service 2>/dev/null;
fi
}

########################################################################################################################
# Désactivation du service #
############################
LLAMA_SYSTEMD_DISABLED(){
if [ $(systemctl is-enabled llama-server.service) == "enabled" ]; then
  echo "Désactivation du service llama-server";
  systemctl daemon-reload;
  systemctl disable --now llama-server.service 2>/dev/null;
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
