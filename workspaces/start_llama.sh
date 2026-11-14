clear;

if [ -f /root/start_llama.sh ]; then
  rm -f /root/start_llama.sh;
fi

cat > /root/start_llama.sh << 'EOF'
#!/usr/bin/bash

# =====================================================================================================
# DOSSIER LLAMA #
# ============= #
LLAMA_DIR="/tmp/IA/output/llama.cpp/bin"

# =====================================================================================================
# Sélection des modèles #
# ===================== #

MODELE_1="Qwen/Qwen3-VL-8B-Instruct-GGUF:Q4_K_M"
MODELE_2=""
MODELE_3=""
MODELE_4=""
MODELE_5=""
MODELE_6=""
LISTES_MODELES="$MODELE_1 $MODELE_2 $MODELE_3 $MODELE_4 $MODELE_5 $MODELE_6"

# =====================================================================================================
# NETTOYAGE CONSOLE #
# ================= #
clear;

# =====================================================================================================
# Phase 1 : Téléchargement des modèles #
# ==================================== #
if [ -d $LLAMA_DIR ]; then
  cd   "$LLAMA_DIR";
else
  exit;
fi

for MODEL in $LISTES_MODELES; do
  echo "Téléchargement du modèle $MODEL";
  ./llama download -hf $MODEL 1>/dev/null;
done

# =====================================================================================================
# Lancement #
# ========= #
if [ "$(pwd)" == "$LLAMA_DIR" ];then
 ./llama-server --host 0.0.0.0 --port 8080 --api-key admin
fi
# =====================================================================================================
EOF

#######################################################################################################
chmod +x /root/start_llama.sh;

bash /root/start_llama.sh;
