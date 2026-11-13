----------------------------------------------------------------------------------------------------------------------------------------------------
# <p align='center'> Construction des outils pour l'Intelligence Artificielle </p>
----------------------------------------------------------------------------------------------------------------------------------------------------
## I. Présentation
### Arborscence
```
├── config
│   ├── docker.conf              # Variables utilisés pour le projet Docker
│   ├── llama.conf               # Variables utilisés pour le projet LLama
│   ├── openwebui.conf           # Variables utilisés pour le projet OpenWebUI
│   └── stablediffusion.conf     # Variables utilisés pour le projet Stable-diffusion
│
├── functions
│   ├── 001_check.sh
│   ├── 010_ollama.sh           # Fonctions liées à Git (clonage, mise à jour)
│   ├── 011_openwebui.sh        # Fonctions liées à la compilation (make, cmake)
│   ├── 012_stablediffusion.sh  # Fonctions d'affichage (messages colorés, erreurs)
│   ├── 100_docker.sh
│
├── globale.conf                # Variables utilisés pour tout le système
│
├── output/                     # Binaires compilés (ignoré par Git)
│
├── src
│
├── start.sh                    # Script principal qui charge tout et exécute
│
└── workspaces/                 # Dépôts téléchargés (ignoré par Git)
```


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
  bash start.sh;
else
  echo "Téléchargement du dépôt IA";
  git clone --quiet https://github.com/MarcJaffre/IA.git /tmp/IA;
  cd /tmp/IA;
  bash start.sh;
fi
```
