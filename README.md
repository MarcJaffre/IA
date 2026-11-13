----------------------------------------------------------------------------------------------------------------------------------------------------
# <p align='center'> Construction des outils pour l'Intelligence Artificielle </p>
----------------------------------------------------------------------------------------------------------------------------------------------------
## I. Présentation
### Arborscence
```
├── config/
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
git clone https://github.com/MarcJaffre/IA.git;
cd IA;
bash build.sh;
```
