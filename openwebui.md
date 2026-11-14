--------------------------------------------------------------------------------------------
# <p align='center'> Construction et exploitation de OpenWebui </p>
--------------------------------------------------------------------------------------------
## I. llama.cpp
### A. Exploitation
#### 0. Définir emplacement du projet
```bash
clear;
WORKDIR=/srv
```

#### 1. Nettoyer
```bash
clear;
# =====================================
if [ -d  $WORKDIR/IA ]; then
  cd     $WORKDIR;
  rm -rf $WORKDIR/IA;
# =====================================
else
 echo "Le dossier est déjà purger";
# =====================================
fi
```

#### 2. Synchroniser le projet
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

#### 3. Construire les applications du projet
```bash
clear;
if [ -d $WORKDIR/IA ]; then
 # ----------------------------------------
 cd $WORKDIR/IA;
  bash ./workspaces/openwebui_build.sh;
 # ----------------------------------------
else
 # ----------------------------------------
 echo "Le dossier IA est absent";
 # ----------------------------------------
fi
```


```bash
clear;
cd /srv/IA/openwebui
python3.11 -m venv venv
source "venv/bin/activate";
pip config set global.cache-dir /tmp/pip-cache
pip install --no-cache-dir  open-webui  --cache-dir /srv/IA/openwebui/download
pip install -r requirements.txt
open-webui serve --port 3000
```




<br />
