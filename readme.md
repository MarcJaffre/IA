--------------------------------------------------------------------------------------------
# <p align='center'> Construction des outils pour l'Intelligence Artificielle </p>
--------------------------------------------------------------------------------------------
## I. Déploiement IA
### A. Présentation
Ce projet à pour objectif de déployer des applications IA sur une distribution Debian.

### B. Prérequis
```bash
clear;
apt update;
apt install -y git;
```

### C. Télécharger Projet
```bash
clear;
if [ ! -d /srv/IA ]; then
 # ------------------------------------------------------
  echo "Téléchargement du projet"
  git clone --quiet https://github.com/MarcJaffre/IA.git;
  cd /srv/IA;
 # ------------------------------------------------------
else
 # ------------------------------------------------------
 echo "Déplacement dans le projet";
 cd /srv/IA;
 git fetch --all;
 git reset --hard origin/main;
 git clean -fd;
 # ------------------------------------------------------
fi
```

### B. Lancer la construction
```bash
clear;
if [ -d /srv/IA ]; then
 # ----------------------
 cd IA;
 bash build.sh
 # ----------------------
fi
```

### B. Lancer l'application
```bash
clear;
if [ -d /srv/IA ]; then
 # ----------------------
 cd IA;
 bash run.sh
 # ----------------------
fi
```


--------------------------------------------------------------------------------------------
## I. Avancement

| Application       | Etat ou Avancement |
|-------------------|--------------------|
| Dépendance        | Opérationnel       |
| Blacklist         | Opérationnel       |
| Nvidia Drivers    | Opérationnel       |
| Nvidia Cuda       | Opérationnel       |
| LLAMA             | 75% (Build 13 min) |
| OpenWebui         | 1%                 |
| Stable-Diffusion  | 1%                 |
| Open-Terminal     | 0%                 |
| SearXNG           | 0%                 |
| Docker            | 0%                 |
