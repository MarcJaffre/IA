--------------------------------------------------------------------------------------------
# <p align='center'> Construction et exploitation de llama.cpp </p>
--------------------------------------------------------------------------------------------
## I. llama.cpp
### A. Exploitation
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
 cd $WORKDIR;
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

#### 2. Construire les applications du projet
```bash
clear;
if [ -d $WORKDIR/IA ]; then
 # ---------------------------------
 cd $WORKDIR/IA;
  bash ./workspaces/llama_build.sh;
 # ---------------------------------
else
 # ---------------------------------
 echo "Le dossier IA est absent";
 # ---------------------------------
fi
```
<br />

#### 3. Lancer ponctuellement l'application
```bash
clear;
if [ -d $WORKDIR/IA ]; then
 # ----------------------
 cd $WORKDIR/IA;
  bash ./workspaces/llama_start.sh;
 # ----------------------
fi
```

<br />

#### 4. Déployer le service Systemd
```bash
clear;
if [ -d $WORKDIR/IA ]; then
 # ----------------------
 cd   $WORKDIR/IA;
  bash ./workspaces/llama_service_install.sh;
 # ----------------------
fi
```
<br />

#### 5. Désnstaller le service Systemd
```bash
clear;
if [ -d $WORKDIR/IA ]; then
 # ----------------------
 cd   $WORKDIR/IA;
  bash ./workspaces/llama_service_uninstall.sh;
 # ----------------------
fi
```

#### 6. Nettoyage
```bash
clear;
if [ -d $WORKDIR/IA ]; then
  cd $WORKDIR/IA;
  rm -rf $WORKDIR/IA;
else
 echo "Le dossier est déjà purger";
fi
```



<br /> <br />


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
