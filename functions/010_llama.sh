########################################################################################################################
# Purge llama.cpp du dossier src #
##################################
LLAMA_PURGE_DIR_SRC(){
if [ -d  "$WORKDIR/src/llama.cpp" ]; then
  # ==============================================================================
  rm -rf "$WORKDIR/src/llama.cpp";
  # ==============================================================================
#else
#  echo "La fonction LLAMA_PURGE_DIR_SRC est en erreur";
fi
}
########################################################################################################################
# Telechargement du depot LLAMA #
#################################
LLAMA_GIT_CLONE(){
if [ ! -d "$WORKDIR/src/llama.cpp" ]; then
  # ==============================================================================
  git clone --quiet "$GITHUB_LLAMA" "$WORKDIR/src/llama.cpp";
  # ==============================================================================
#else
#  echo "La fonction LLAMA_GIT_CLONE est en erreur";
fi
}
########################################################################################################################
# Purge llama.cpp du dossier output #
#####################################
LLAMA_PURGE_DIR_OUTPUT(){
if [ -d  "$WORKDIR/output/llama.cpp" ]; then
  # ==============================================================================
  rm -rf "$WORKDIR/output/llama.cpp";
  # ==============================================================================
#else
  #echo "La fonction LLAMA_PURGE_DIR_OUTPUT est en erreur";
fi
}
########################################################################################################################
# Configuration de la compilation #
###################################
LLAMA_CONFIG_BUILD(){
if [ -d "$WORKDIR/src/llama.cpp" ]; then
  # ==============================================================================
  cd    "$WORKDIR/src/llama.cpp";
  cmake -B build $CMAKE_ARGS --log-level=ERROR > /dev/null;
  # ==============================================================================
#else
  #echo "La fonction LLAMA_CONFIG_BUILD est en erreur";
fi
}
########################################################################################################################
# Lancement de la compilation #
###############################
LLAMA_MAKE_BUILD(){
if [ -d "$WORKDIR/src/llama.cpp" ]; then
  # ==============================================================================
  cd    "$WORKDIR/src/llama.cpp";
  cmake --build build --config Release -j "$BUILD_CPUS" > /dev/null;
  # ==============================================================================
#else
  #echo "La fonction LLAMA_MAKE_BUILD est en erreur";
fi
}
########################################################################################################################
# Compiler et sortir les binaires dans output #
###############################################
LLAMA_BUILD_OUTPUT(){
if [ -d "$WORKDIR/src/llama.cpp" ]; then
  # ==============================================================================
   cd "$WORKDIR/src/llama.cpp";
  # ==============================================================================
   if [ ! -d "$WORKDIR/output/llama.cpp" ]; then
      mkdir  "$WORKDIR/output/llama.cpp";
      cmake --install build --prefix "$WORKDIR/output/llama.cpp" > /dev/null;
      touch $WORKDIR/output/llama_ready;
   fi
  # ==============================================================================
#else
  #echo "La fonction LLAMA_BUILD_02 est en erreur";
fi
}

########################################################################################################################
# Déplacement de la Source vers output #
########################################
LLAMA_BUILD_MV_BIN(){
if [ ! -d "$WORKDIR/output/llama.cpp" ]; then
  # ==============================================================================
  echo "Déplacement des binaires llama.cpp";
  # ==============================================================================
  cd      "$WORKDIR/src/llama.cpp/build/bin/"
  # ==============================================================================
  mkdir   "$WORKDIR_FINAL/llama.cpp";
  mv *    "$WORKDIR_FINAL/llama.cpp";
  # ==============================================================================
  find    "$WORKDIR_FINAL/llama.cpp" \
  -type f \
  -iname "llama*" \
  -exec chmod +x {} \;
  # ==============================================================================
fi
}
########################################################################################################################
# Creation du Service #
#######################
LLAMA_SYSTEMD_ADD(){
# ================================================================================
echo "Création du service llama-server.service";
# ================================================================================
if [ -f /etc/systemd/system/llama-server.service ]; then
  rm -f /etc/systemd/system/llama-server.service;
fi
# ================================================================================
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
# ================================================================================
systemctl daemon-reload;
# ================================================================================
}
########################################################################################################################
# Suppression du Service #
##########################
LLAMA_SYSTEMD_DEL(){
# Check fichier si il existe
if [ -f etc/systemd/system/llama-server.service ]; then
  # ==============================================================================
  if [ $(systemctl is-enabled llama-server.service) == "enabled" ]; then
    echo "Désactivation du service llama-server";
    systemctl disable --now llama-server.service 2>/dev/null;
    systemctl daemon-reload;
  fi
  # ==============================================================================
  echo "Suppression du service llama-server";
  rm -f /etc/systemd/system/llama-server.service;
  # ==============================================================================
else
 echo "La fonction LLAMA_SYSTEMD_DEL est en anomalie";
fi
}
########################################################################################################################
# Activation du service #
#########################
LLAMA_SYSTEMD_ENABLED(){
if [ $(systemctl is-enabled llama-server.service) == "disabled" ]; then
  # ==============================================================================
  echo "Activation du service llama-server";
  # ==============================================================================
  systemctl daemon-reload;
  systemctl enable --now llama-server.service 2>/dev/null;
  # ==============================================================================
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
# ==============================================================================
cd "$WORKDIR/output/llama.cpp";
echo "";
# ==============================================================================
find . -type f -iname "llama*" -exec chmod +x {} \;
# ==============================================================================
./llama-server --host "0.0.0.0" --port "3000"
# ==============================================================================
}

########################################################################################################################
# cd /tmp/IA/workspaces/
# bash start_llama.sh
########################################################################################################################

