#!/usr/bin/bash

# bash /srv/IA/workspaces/demo.sh

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
LISTE_MODEL="Qwen/Qwen3-VL-8B-Instruct-GGUF:Q4_K_M"

# ========================================================================
# Dossier de Travail #
# ================== #
if   [ -f "$SRC/llama-server" ]; then
  # -------------------------------------------------------------------
  cd "$SRC";
  for model in $LISTE_MODEL; do ./llama download -hf $model; done
  ./llama-server ${OPTIONS[@]};
  # -------------------------------------------------------------------
elif [ -f "$OUT/llama-server" ]; then
  # -------------------------------------------------------------------
  cd "$OUT";
  for model in $LISTE_MODEL; do ./llama download -hf $model; done
  ./llama-server ${OPTIONS[@]};
  # -------------------------------------------------------------------
fi
