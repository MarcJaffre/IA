#!/usr/bin/bash

# ========================================================================
# Configuration du script #
# ======================= #
WORKDIR="/tmp/IA"
SUBDIR="src"
PARM_1="--host 0.0.0.0"
PARM_2="--port 8080"
PARM_3="--api-key admin"

# ========================================================================
# Chargement Parametre #
# ==================== #
OPTIONS="$PARM_1 $PARM_2 $PARM_3"

# ========================================================================
# Dossier de Travail #
# ================== #
if [ -d "$WORKDIR/$SUBDIR/llama.cpp/build/bin/" ]; then
     cd "$WORKDIR/$SUBDIR/llama.cpp/build/bin/";
else
 echo "Le dossier de travail est en erreur";
fi

# ========================================================================
# Lancement #
#############

if [ -f llama-server ]; then
  ./llama-server "$OPTIONS";
fi
