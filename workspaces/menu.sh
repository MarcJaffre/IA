#!/usr/bin/bash

# ====================================================================================================================================================================
# Arrête le script immédiatement en cas d'erreur #
# ============================================== #
set -e

# ====================================================================================================================================================================
# Définir la variable WORKDIR #
# =========================== #
BASE_CONFIG_WORKDIR(){
if [[ "$PWD" != *IA* ]]; then
 WORKDIR=$PWD/IA
 export WORKDIR=${WORKDIR};
fi
}
# ====================================================================================================================================================================
# Fichier Configuration #
# ===================== #
BASE_CONFIG_FILE(){
# Ne pas être dans IA !
if [ ! -f ${WORKDIR}/config/globale.conf ]; then
  # =============================================================================
  mv ${WORKDIR}/config/globale.conf.exemple     ${WORKDIR}/config/globale.conf;
  sed -i -e "s|WORKDIR=.*|WORKDIR=${WORKDIR}|g" ${WORKDIR}/config/globale.conf;
  # =============================================================================
fi
}
# ====================================================================================================================================================================
# Fichier Configuration #
# ===================== #
BASE_CONFIG_LOAD(){
if [ -f ${WORKDIR}/config/globale.conf ]; then
  # ===========================================================================================================
  source ${WORKDIR}/config/globale.conf;
  # ===========================================================================================================
  for file in $(find $WORKDIR/config    -type f -name "*.conf" ! -name globale.conf); do source $file; done
  for file in $(find $WORKDIR/functions -type f -name "*.sh");                        do source $file; done
  # ===========================================================================================================
fi
}
# ====================================================================================================================================================================
# Fonction d'affichage et de saisie

BASE_MENU_SELECTION() {
    clear;
    echo "================================================="
    echo "          MENU PRINCIPAL                         "
    echo "================================================="
    echo "Dossier de travail Tempo : $WORKDIR";
    echo "Dossier de Travail Final : $WORKDIR_FINAL";
    echo "";
    echo "================================================="
    echo "A) Menu A : Installation des Dependances"
    echo "B) Menu B : Installation de GPU-Unlock Nvidia"
    echo "";
    echo "================================================="
    echo "C) Menu C : Construction de LLAMA"
   #echo "D) Menu D : Construction de OpenWebui"
    echo "";
    echo "================================================="
    echo "E) Menu E : Installation du service Llama"
   #echo "F) Menu F : Installation du service OpenWebui"
    echo "G) Menu G : Désinstallation du service Llama"
   #echo "H) Menu H : Désinstallation du service OpenWebui" 
    echo "";
    echo "================================================="
    echo "M) Menu M: Lancer le téléchargement des modèles"   
    echo "================================================="
    echo "R) Menu R : Redémarrage de la machine"
    echo "q) Menu Q : Quitter"
    echo "================================================="
    echo "";
    read -p "Sélectionner votre choix ? " REPONSE
    echo "";
}

# ====================================================================================================================================================================
# Fonction gérant la boucle et le traitement du choix
BASE_CHOIX() {
    while true; do
        # Appel de l'affichage du menu
        BASE_MENU_SELECTION
        # Analyse de la variable $REPONSE
        case "$REPONSE" in
            # ========================================================================================================
            # Installation des Dependances
            a|A)
               clear;
               bash ${WORKDIR}/workspaces/base/install_packages.sh 1>/dev/null;
               echo "";
               echo "---------------------------------------------------------------------------";
               read -p "Appuyez sur Entrée pour continuer..."
               ;;
            # ========================================================================================================
            # Installation de GPU-Unlock Nvidia
            b|B)
               clear;
               bash ${WORKDIR}/workspaces/base/Nvidia_gpu_unlock.sh;
               read -p "Appuyez sur Entrée pour continuer..."
               ;;
            # ========================================================================================================
            # Construction de LLAMA"
            c|C)
               clear;
               bash ${WORKDIR}/workspaces/llama/build.sh;
               read -p "Appuyez sur Entrée pour continuer..."
               ;;
            # ========================================================================================================
            # Construction de OpenWebui
            #d|D)
            #   clear;
            #   echo "-> Vous avez choisi le Menu 3."
            #   read -p "Appuyez sur Entrée pour continuer..."
            #   ;;
            # ========================================================================================================
            # Installation du service Llama
            e|E)
               clear;
               bash ${WORKDIR}/workspaces/llama/service_install.sh;
               read -p "Appuyez sur Entrée pour continuer..."
               ;;
            # ========================================================================================================
            # Installation du service OpenWebui
            #f|F)
            #   clear;
            #   bash ${WORKDIR}/workspaces/openwebui/service_install.sh;
            #   read -p "Appuyez sur Entrée pour continuer..."
            #   ;;
            # ========================================================================================================
            # Désinstallation du service Llama
            g|G)
               clear;
               bash ${WORKDIR}/workspaces/llama/service_uninstall.sh;
               read -p "Appuyez sur Entrée pour continuer..."
               ;;
            # ========================================================================================================
            # Désinstallation du service OpenWebui
            #h|H)
            #   clear;
            #   bash ${WORKDIR}/workspaces/openwebui/service_uninstall.sh;
            #   read -p "Appuyez sur Entrée pour continuer..."
            #   ;;
            # ========================================================================================================
            # Lancer le téléchargement des modèles
            m|M)
               clear;
               bash ${WORKDIR}/workspaces/llama/start.sh;
               read -p "Appuyez sur Entrée pour continuer..."
               ;;
            # ========================================================================================================
            # Redémarrer la machine
            r|R)
               clear;
               reboot;
               ;;
            # ========================================================================================================
            # Quitter le menu
            q|Q)
               clear;
               echo "Fermeture du menu. Au revoir !"
               break
               ;;
            # ========================================================================================================
            # Menu de Test
            0)
               clear;
               echo "Dossier de travail: $WORKDIR | Finale: $WORKDIR_FINAL";
               echo "GIT LLAMA : $GITHUB_LLAMA";
               echo "";
               read -p "Appuyez sur Entrée pour continuer..."
               ;;
            # ========================================================================================================
            # Choix incorrect
            *)
               clear;
               echo "Erreur : Choix invalide ($REPONSE). Veuillez réessayer."
               sleep 2
               ;;
            # ========================================================================================================
        esac
    done
}

# ====================================================================================================================================================================
# Lancement du script #
# =================== #
BASE_CONFIG_WORKDIR;
BASE_CONFIG_FILE;
BASE_CONFIG_LOAD;

BASE_CHOIX;
