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
```bash
clear;
cd /srv;
rm -rf IA 2>/dev/null;
git clone --quiet  https://github.com/MarcJaffre/IA.git;
cd IA;
bash build.sh;
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
