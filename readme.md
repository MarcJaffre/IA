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

### B. Construction du Projet
#### 1. Purge
```bash
clear;
cd $HOME;
rm -rf /srv/IA;
```
#### 2. Télécharger le Template
```bash
clear;
cd /srv
git clone --quiet  https://github.com/MarcJaffre/IA.git;
cd IA;
```

#### 3. Start.sh
```bash
clear;
git fetch --all
git reset --hard origin/main
git clean -fd
bash start.sh;
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
