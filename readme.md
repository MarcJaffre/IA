----------------------------------------------------------------------------------------------------------------------------------------------------
# <p align='center'> Construction des outils pour l'Intelligence Artificielle </p>
----------------------------------------------------------------------------------------------------------------------------------------------------
## I. Présentation
### A. Prérequis
```bash
apt install -y git;
```

### B. Utilisation
```bash
clear;
cat > test.sh << 'EOF'
if [ -d /tmp/IA 2>/dev/null ]; then
  cd $HOME;
  rm -rf /tmp/IA;
  git clone --quiet https://github.com/MarcJaffre/IA.git /tmp/IA;
  cd /tmp/IA;
  bash start.sh;
else
  git clone --quiet https://github.com/MarcJaffre/IA.git /tmp/IA;
  cd /tmp/IA;
  bash start.sh;
fi
EOF
bash test.sh
```


### C. Arborscence
```
├── config
│   ├── docker.conf              # Variables utilisés pour le projet Docker
│   ├── llama.conf               # Variables utilisés pour le projet LLama
│   ├── openwebui.conf           # Variables utilisés pour le projet OpenWebUI
│   └── stablediffusion.conf     # Variables utilisés pour le projet Stable-diffusion
│
├── functions
│   ├── 000_Message.sh          # Message Dédiée au terminal
│   ├── 001_check.sh            # Fonctions liées à la vérification
│   ├── 010_ollama.sh           # Fonctions liées à Git (clonage, mise à jour)
│   ├── 011_openwebui.sh        # Fonctions liées à la compilation (make, cmake)
│   ├── 012_stablediffusion.sh  # Fonctions liées à la compilation (make, cmake)
│   ├── 100_docker.sh           # Fonctions pour installer Docker
│   └── 999_package.sh          # Fonctions pour installer les dépendances, pilotes
│
├── globale.conf                # Variables utilisés pour tout le système
│
├── output/                     # Binaires compilés (ignoré par Git)
│
├── src                         # Dossier de téléchargement des sources.
│
├── start.sh                    # Script principal qui charge tout et exécute
│
├── Changelog.md                # Information sur les modifications du projet
├
└── workspaces/                 # Dépôts téléchargés (ignoré par Git)
```

### D. Fonctionnement
```
Bash                                                   │
 ├──> Phase 1 Load globale.conf                        V
 │            ├──> Load ./functions/*                  |
 │            │    ├──> 000_Message.sh                 │
 │            │    ├──> 001_check.sh                   │
 │            │    ├──> 010_ollama.sh                  │
 │            │    ├──> 011_openwebui.sh               │
 │            │    ├──> 012_stablediffusion.sh         │
 │            │    ├──> 100_docker.sh                  │
 │            │    └──> 999_package.sh                 │
 │            |    └──> ....                           |
 |            |                                        |
 │            └──> Load ./config/*                     V
 │                 ├──> docker.conf                    |
 │                 ├──> llama.conf                     |
 │                 ├──> openwebui.conf                 |
 │                 ├──> stablediffusion.conf           |
 │                 └──> ....                           |
 │                                                     |
 └──> Phase 2 Load Functions                           V
              |
              ├──> 
              ├──>
              ├──>
              ├──>
              └──>
```
