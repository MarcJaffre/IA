#!/usr/bin/bash

# /srv/IA/workspaces/demo.sh

# ========================================================================
# Configuration du script #
# ======================= #
WORKDIR="/srv/IA"
SRC="$WORKDIR/src/llama.cpp/build/bin/"
OUT="$WORKDIR/output/llama.cpp"

# ========================================================================
# Configuration de LLAMA #
# ====================== #
OPTIONS=(
  --host "0.0.0.0"
  --port "8080"
  --api-key "admin"
)

# ========================================================================
# Dossier de Travail #
# ================== #
if   [ -f "$SRC/llama-server" ]; then
  # -------------------------------------------------------------------
  cd "$SRC" 
  ./llama download -hf Qwen/Qwen3-VL-8B-Instruct-GGUF:Q4_K_M
  ./llama-server ${OPTIONS[@]};
  # -------------------------------------------------------------------
elif [ -f "$OUT/llama-server" ]; then
  # -------------------------------------------------
  cd "$OUT";
  ./llama download -hf Qwen/Qwen3-VL-8B-Instruct-GGUF:Q4_K_M
  ./llama-server ${OPTIONS[@]};
  # -------------------------------------------------
fi
