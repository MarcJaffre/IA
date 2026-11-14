#
apt install -y pkg-config
cd 
rm rf  Python-3.11.18* 2>/dev/null;
wget https://www.python.org/ftp/python/3.11.18/Python-3.11.18.tar.xz
tar -xf Python-3.11.18.tar.xz
cd Python-3.11.18
./configure --enable-optimizations
make -j$(nproc)
make altinstall
