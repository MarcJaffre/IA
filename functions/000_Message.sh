# =====================================================================================
# ╔ ═══ ╗
# ║     ║
# ╚ ═══ ╝

MESSAGE_OLD_TOP(){
echo "╔══════════════════════════════════════════════════════╗";
echo "║                                                      ║";
echo "║         ════ Intelligence Artificielle ════          ║";
echo "║                                                      ║";
echo "║    ════ BIENVENUE SUR LE SCRIPT DE DÉPLOIEMENT ════  ║";
echo "║                                                      ║";
echo "║                   Par Marc JAFFRE                    ║";
echo "║                                                      ║";
echo "║                 Tous droits réservés                 ║";
echo "║                                                      ║";
echo "╚══════════════════════════════════════════════════════╝";
echo "";
}

MESSAGE_TOP(){
echo "
╔══════════════════════════════════════════════════════╗
║                                                      ║
║         ════ Intelligence Artificielle ════          ║
║                                                      ║
║    ════ BIENVENUE SUR LE SCRIPT DE DÉPLOIEMENT ════  ║
║                                                      ║
║                   Par Marc JAFFRE                    ║
║                                                      ║
║                 Tous droits réservés                 ║
║                                                      ║
╚══════════════════════════════════════════════════════╝
"
}
# =====================================================================================
MESSAGE_LOADING_GLOBAL(){
echo "╔══════════════════════════════════════════════════════╗";
echo "║ - Phase 0 - Chargement de la configuration Globale   ║";
}

# =====================================================================================
MESSAGE_LLAMA_PURGE_SRC(){
echo "║ - Phase 1 - Purge du dossier sources\llama.cpp       ║";
}

# =====================================================================================
MESSAGE_LLAMA_GIT_CLONE(){
echo "║ - Phase 2 - Téléchargement dans sources\llama.cpp    ║";
}
# =====================================================================================
MESSAGE_LLAMA_PURGE_OUTPUT(){
echo "║ - Phase 3 - Purge du dossier output                  ║";
}
# =====================================================================================
MESSAGE_LLAMA_BUILD(){
echo "║ - Phase 4 - Compilation dans output\llama.cpp        ║";
}
# =====================================================================================

MESSAGE_LLAMA_END(){
echo "║ - Phase 5 - Fin de la construction de llama.cpp      ║";
}
# =====================================================================================
MESSAGE_BOT(){
echo "║                                                      ║";
echo "║                 Version Alpha 0.1                    ║";
echo "║                                                      ║";
echo "╚══════════════════════════════════════════════════════╝";
}

