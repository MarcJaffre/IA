#!/usr/bin/bash
# =================================================================================================
# Arrête le script immédiatement en cas d'erreur #
# ============================================== #
set -e

# =================================================================================================
# Chargement de la configuration du WORKDIR #
# ========================================= #
if [ -f "./globale.conf" ]; then
  source "./globale.conf";
else
  echo "Le fichier globale.conf n'existe pas";
fi

# =================================================================================================
# Dossier output llama #
# ==================== #
if [ -d "$WORKDIR/output/llama.cpp/bin" ]; then
  cd    "$WORKDIR/output/llama.cpp/bin";
else
  echo "Le dossier output/llama.cpp/bin est absent";
  exit;
fi

# =================================================================================================
# Création du service #
#######################
# LLAMA_SYSTEMD_ADD

# ================================================================================
#echo "Création du service llama-server.service";

# ================================================================================
#if [ -f /etc/systemd/system/llama-server.service ]; then
#  rm -f /etc/systemd/system/llama-server.service;
#fi
# ================================================================================
# cat > /etc/systemd/system/llama-server.service <<EOF
echo "
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
"

# EOF
# ================================================================================
#systemctl daemon-reload;
# ================================================================================






