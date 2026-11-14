-------------------------------------------------------------------------------------------------------------------------
# <p align='center'> Guide sur l'utilisation de python </p>
-------------------------------------------------------------------------------------------------------------------------
# I. Debian 13
### A. Python 3.11
#### 1. Dépendances:
```
apt install -y pkg-config
apt install -t libffi-dev
```
#### 2. Téléchargement
```bash
clear;
wget https://www.python.org/ftp/python/3.11.18/Python-3.11.18.tar.xz;
tar -xf Python-3.11.18.tar.xz;
cd Python-3.11.18;
```
#### 3. Configuration
```bash
clear;
./configure --enable-optimizations;
```
#### 4. Compilation
```bash
clear;
make -j$(nproc);
```
#### 5. Installation
```bash
clear;
make altinstall;
```
#### 6. Validation
```bash
clear;
python3.11 --version
``` 
