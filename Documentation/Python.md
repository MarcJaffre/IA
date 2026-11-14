-------------------------------------------------------------------------------------------------------------------------
# <p align='center'> Guide sur l'utilisation de python </p>
-------------------------------------------------------------------------------------------------------------------------
# I. Debian 13
### A. Déployer une version de Python
#### 1. Vers. 3.11
```
clear;
cd $HOME;
rm rf  Python-3.11.18* 2>/dev/null;
wget https://www.python.org/ftp/python/3.11.18/Python-3.11.18.tar.xz
tar -xf Python-3.11.18.tar.xz
cd Python-3.11.18
./configure --enable-optimizations
make -j$(nproc)
make altinstall

apt install -y pkg-config
apt install -t libffi-dev
```
