# =====================================================================================
MESSAGE_TOP(){
echo " ____________________________________________________ ";
echo "|                  Par Marc JAFFRE                   |";
echo "|  ==== BIENVENUE SUR LE SCRIPT DE DEPLOIEMENT ====  |";
echo "|____________________________________________________|";
echo "                                                      ";
echo " ____________________________________________________ ";
echo "| - Phase 0 - Chargement de la configuration Globale |";
}


# =====================================================================================
MESSAGE_LLAMA_PURGE_GIT(){
echo "| - Phase 1 - Purge du dossier WORKDIR               |";
}

# =====================================================================================
MESSAGE_LLAMA_GIT(){
echo "| - Phase 2 - Téléchargement des sources de LLAMA    |";
}

# =====================================================================================
MESSAGE_LLAMA_BUILD(){
echo "| - Phase 3 - Construction du projet LLAMA           |";
}
