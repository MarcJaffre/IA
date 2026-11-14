--------------------------------------------------------------------------------------------
# <p align='center'> Construction des outils pour l'Intelligence Artificielle </p>
--------------------------------------------------------------------------------------------
## I. Déploiement IA
### A. Présentation
Ce projet à pour objectif de déployer des applications IA sur une distribution Debian.

### B. Prérequis
```bash
clear;
# ================================
if [ ! -f /usr/bin/git ]; then
  apt update;
  apt install -y git;
fi
# ================================
```

### B. Utilisation
```bash
clear;
cat > test.sh << 'EOF'
#!/usr/bin/bash

# =============================================================================
# Variables #
# ========= #
GITHUB_IA="https://github.com/MarcJaffre/IA.git"
WORKDIR="/tmp/IA"

# =============================================================================
# Purge du dossier WORKDIR #
############################
# rm -rf $WORKDIR 2>/dev/null;
if [ -d $WORKDIR ]; then
 cd $HOME
 echo "OK";
 rm -rf $WORKDIR
fi

# =============================================================================
# Télécharger projet #
# ================== #
git clone --quiet $GITHUB_IA "$WORKDIR";

# =============================================================================
# DOSSIER PROJET #
# ============== #
cd "$WORKDIR";

# =============================================================================
# LANCEMENT PROJET #
# ================ #
bash start.sh;
EOF

bash test.sh;
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
              ├──> [999_package.sh] Installation des dépendances
              ├──>
              ├──> [999_package.sh] Blackliste du pilote vidéo libre (Nouveau)
              ├──>
              ├──> [999_package.sh] Installation du pilote Nvidia
              ├──> [999_package.sh] Installation de paquet Nvidia-Cuda-Toolkit
              ├──>
              ├──> [010_ollama.sh] Purge du dossier du dossier output de LLAMA
              ├──> [010_ollama.sh] Clonage du dépôt LLAMA via Git
              ├──> [010_ollama.sh] Construction de LLAMA
              ├──> [010_ollama.sh] Dossier de Sortie configurer pour LLAMA
              ├──> [010_ollama.sh] Création      du service SYSTEMD pour LLAMA
              ├──> [010_ollama.sh] Activation    du service SYSTEMD pour LLAMA
              ├──> [010_ollama.sh] Désactivation du service SYSTEMD pour LLAMA
              ├──> [010_ollama.sh] Suppression   du service SYSTEMD pour LLAMA
              └──>
```

<br />

--------------------------------------------------------------------------------------------
## I. Avancement

| Application       | Etat ou Avancement |
|-------------------|--------------------|
| Dépendance        | Opérationnel       |
| Blacklist         | Opérationnel       |
| Nvidia Drivers    | Opérationnel       |
| Nvidia Cuda       | Opérationnel       |
| LLAMA             | 90%                |
| OpenWebui         | 1%                 |
| Stable-Diffusion  | 1%                 |
| Open-Terminal     | 0%                 |
| SearXNG           | 0%                 |
| Docker            | 0%                 |
