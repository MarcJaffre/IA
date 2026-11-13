----------------------------------------------------------------------------------------------------------------------------------------------------
# <p align='center'> Construction des outils pour l'Intelligence Artificielle </p>
----------------------------------------------------------------------------------------------------------------------------------------------------
## I. Présentation
### Arborscence
```
├── config/
│   └── docker.conf            # Variables utilisés pour le projet Docker
│   └── ollama.conf            # Variables utilisés pour le projet LLama
│   └── openwebui.conf         # Variables utilisés pour le projet OpenWebUI
│   └── stablediffusion.conf   # Variables utilisés pour le projet Stable-diffusion
├── functions/                 # Dossier contenant vos fonctions réutilisables
│   ├── ollama.sh              # Fonctions liées à Git (clonage, mise à jour)
│   ├── openwebui.sh           # Fonctions liées à la compilation (make, cmake)
│   └── stablediffusion.sh     # Fonctions d'affichage (messages colorés, erreurs)
├── workspaces/                # Dépôts téléchargés (ignoré par Git)
├── output/                    # Binaires compilés (ignoré par Git)
├── build.sh                   # Script principal qui charge tout et exécute
└── README.md                  # Documentation
```
### B. Utilisation
```bash
clear;

if [ -d /tmp/IA 2>/dev/null ]; then
  echo "Suppression du dépôt IA";
  cd $HOME;
  rm -rf /tmp/IA;
  echo "Téléchargement du dépôt IA";
  git clone --quiet https://github.com/MarcJaffre/IA.git /tmp/IA;
  cd /tmp/IA;
else
  echo "Téléchargement du dépôt IA";
  git clone --quiet https://github.com/MarcJaffre/IA.git /tmp/IA;
  cd /tmp/IA;
fi
```
