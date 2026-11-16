--------------------------------------------------------------------------------------------
# <p align='center'> Construction des outils pour l'Intelligence Artificielle </p>
--------------------------------------------------------------------------------------------
## I. Préparation du système
### A. Présentation
Ce projet à pour objectif de déployer des applications IA sur une distribution Debian.

### B. Prérequis
```bash
clear;
apt update;
apt install -y git;
```

### C. Exploitation
#### 0. Téléchargement du projet
```bash
clear;
cd $HOME;
rm -r IA 2>/dev/null;
git clone --quiet https://github.com/MarcJaffre/IA.git;
```


#### 2. Installer les dependances
```bash
clear;
WORKDIR=$(pwd)
bash $WORKDIR/IA/workspaces/debian_base.sh;
```

#### 3. Nettoyage
```bash
clear;
cd $HOME;
rm -r /srv/IA;
```


<br /> <br /> <br />


--------------------------------------------------------------------------------------------
## I. Avancement

| Application       | Etat ou Avancement | Prise de note                   |
|-------------------|--------------------|---------------------------------|
| Dépendance        | Opérationnel       |                                 |
| Blacklist         | Opérationnel       |                                 |
| Nvidia Drivers    | Opérationnel       |                                 |
| Nvidia Cuda       | Opérationnel       |                                 |
| LLAMA             | 99%                | Il manque a ajouter les modèles |
| OpenWebui         | 1%                 |                                 |
| Stable-Diffusion  | 1%                 |                                 |
| Open-Terminal     | 0%                 |                                 |
| SearXNG           | 0%                 |                                 |
| Docker            | 0%                 |                                 |
