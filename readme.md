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

### C. Exploitation
#### 0. Définir emplacement du projet
```bash
clear;
WORKDIR=/srv
```
#### 1. Synchroniser le projet
```bash
clear;

if [ ! -d $WORKDIR/IA ]; then
 # ----------------------------------------------------------------
  git clone --quiet https://github.com/MarcJaffre/IA.git;
  cd $WORKDIR/IA;
 # ----------------------------------------------------------------
else
 # ----------------------------------------------------------------
 cd $WORKDIR/IA;
 git fetch --all               2>/dev/null;
 git reset --hard origin/main  1>/dev/null;
 git clean -fd                 2>/dev/null;
 # ----------------------------------------------------------------
fi
```
#### 2. Installer les dependances
```bash
clear;

if [ -d $WORKDIR/IA ]; then
 # ----------------------------------------------------------------
  cd $WORKDIR/IA;
  bash dependances.sh;
else
 echo "Le fichier dependances.sh est absent";
 # ----------------------------------------------------------------
fi
```


#### 4. Construire les applications du projet
```bash
clear;
if [ -d $WORKDIR/IA ]; then
 # ---------------------------------
 cd $WORKDIR/IA;
 bash build.sh;
 # ---------------------------------
else
 # ---------------------------------
 echo "Le dossier IA est absent";
 # ---------------------------------
fi
```
#### 4. Lancer l'application
```bash
clear;
if [ -d /srv/IA ]; then
 # ----------------------
 cd IA;
 bash run.sh
 # ----------------------
fi
```



<br /> <br /> <br />


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
