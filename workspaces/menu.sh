#!/usr/bin/bash

# Le test echo "$PWD" indique le dossier parent de IA.

# Fonction d'affichage et de saisie
FUNC_MENU_SELECTION() {
    clear
    echo "================================================="
    echo "          MENU PRINCIPAL                         "
    echo "================================================="
    echo "1) Menu 1 : Installation Dependances"
    echo "2) Menu 2 : Option deux"
    echo "3) Menu 3 : Option trois"
    echo "q) Quitter"
    echo "=================================="
    
    # Lecture de la réponse sur la même ligne
    read -p "Sélectionner votre choix ? " REPONSE
}

# Fonction gérant la boucle et le traitement du choix
FUNC_CHOIX() {
    while true; do
        # Appel de l'affichage du menu
        FUNC_MENU_SELECTION

        # Analyse de la variable $REPONSE
        case "$REPONSE" in
            1)
                bash ./IA/workspaces/debian_base.sh;
                read -p "Appuyez sur Entrée pour continuer..."
                ;;
            2)
                echo "-> Vous avez choisi le Menu 2."
                read -p "Appuyez sur Entrée pour continuer..."
                ;;
            3)
                echo "-> Vous avez choisi le Menu 3."
                read -p "Appuyez sur Entrée pour continuer..."
                ;;
            q|Q)
                echo "Fermeture du menu. Au revoir !"
                break
                ;;
            *)
                echo "Erreur : Choix invalide ($REPONSE). Veuillez réessayer."
                sleep 2
                ;;
        esac
    done
}

# Lancement du programme
FUNC_CHOIX
