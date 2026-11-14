#!/usr/bin/bash

###########################################################################################################################################
# Variables #
#############
clear;
LLAMA_DIR="/root/llama.cpp"
MODELE_1="Qwen/Qwen3-VL-8B-Instruct-GGUF:Q4_K_M"
MODELE_2=""
MODELE_3=""
MODELE_4=""
MODELE_5=""
MODELE_6=""
LISTES_MODELES="$MODELE_1 $MODELE_2 $MODELE_3 $MODELE_4 $MODELE_5 $MODELE_6"

#################################################################################################
# Phase 1 : Téléchargemetn des modèles #
########################################

# Verification du dossier LLAMA existant
if [ -d $LLAMA_DIR ]; then
  # =======================================
  # Le dossier existe, aller dedans
  cd "$LLAMA_DIR";
  # =======================================
  # Telecharger la liste des Modeles
  for MODEL in $LISTES_MODELES; do
    ./llama download -hf $MODEL 1>/dev/null;
  done
  # =======================================
else
  echo "Le dossier $LLAMA_DIR n'existe pas";
fi
