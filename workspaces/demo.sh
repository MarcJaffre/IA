#!/usr/bin/bash
# echo "" > /srv/IA/workspaces/demo.sh; nano /srv/IA/workspaces/demo.sh; bash /srv/IA/workspaces/demo.sh
# bash 

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
if   [ -f "$SRC/llama-server" ]; then
  # -------------------------------------------------------------------
  cd "$SRC";
  echo "Utilisation du dossier $SRC";
  for model in $LISTE_MODEL; do ./llama download -hf $model; done
  ./llama-server ${OPTIONS[@]};
  # -------------------------------------------------------------------
fi

if [ -f "$OUT/llama-server" ]; then
  # -------------------------------------------------------------------
  cd "$OUT";
  echo "Utilisation du dossier $OUT"
  for model in $LISTE_MODEL; do ./llama download -hf $model; done
  ./llama-server ${OPTIONS[@]};
  # -------------------------------------------------------------------
fi
