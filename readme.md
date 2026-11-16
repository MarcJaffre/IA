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

### C. Exploitation du projet (Developpement)
```bash
clear;
curl -s https://raw.githubusercontent.com/MarcJaffre/IA/refs/heads/main/dev.sh | bash 
```

### D. Nettoyage du projet
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
