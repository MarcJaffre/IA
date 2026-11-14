#!/usr/bin/bash

# ========================================================================================
# Configuration du script #
# ======================= #
WORKDIR="/srv/IA"

# ========================================================================================
# Configuration de LLAMA #
# ====================== #
LISTE_MODEL="Qwen/Qwen3-VL-8B-Instruct-GGUF:Q4_K_M"

clear;

# ========================================================================================
# Dossier de Travail #
# ================== #
if   [ -d "$WORKDIR/output/llama.cpp" ]; then
     # ==========================================
     cd   "$WORKDIR/output/llama.cpp";
     # ==========================================
elif [ -d "$WORKDIR/src/llama.cpp/build/bin" ]; then
     # ==========================================
     cd   "$WORKDIR/src/llama.cpp/build/bin";
     # ==========================================
else
 echo "Le script est KO";
fi

# ========================================================================================
# Téléchargement des modèles #
##############################
if [ -f llama ]; then
 # ------------------------------------------------------------------
 MODELS_DIR="$(pwd)/models";
 export LLAMA_CACHE="$MODELS_DIR";
 # ------------------------------------------------------------------
 mkdir -p "$MODELS_DIR";
 # ------------------------------------------------------------------
 OPTIONS=(
   --host "0.0.0.0"
   --port "8080"
   --api-key "admin"
   --models-dir "$MODELS_DIR"
 )
 # ------------------------------------------------------------------
 for model in $LISTE_MODEL; do ./llama download -hf "$model"; done
 # ------------------------------------------------------------------
 ./llama-server "${OPTIONS[@]}";
fi
 
# echo "" > /srv/IA/workspaces/demo.sh; nano /srv/IA/workspaces/demo.sh; bash /srv/IA/workspaces/demo.sh
