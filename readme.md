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


### C Arborscence
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
│   └── 100_docker.sh           # Fonctions pour installer Docker
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
