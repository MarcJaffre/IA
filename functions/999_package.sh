HOST_DEBIAN_APT(){
if [ ! -d /usr/share/build-essential         ]; then apt install -y build-essential;                          fi
if [ ! -d /usr/share/cmake                   ]; then apt install -y cmake;                                    fi
if [ ! -d /usr/share/doc/curl                ]; then apt install -y curl;                                     fi
if [ ! -d /usr/share/doc/gnupg2              ]; then apt install -y gnupg2;                                   fi
if [ ! -d /usr/src/linux-headers-$(uname -r) ]; then apt install -y apt install -y linux-headers-$(uname -r); fi
if [ ! -d /usr/share/doc/pciutils            ]; then apt install -y apt install -y pciutils;                  fi
if [ ! -d /usr/share/doc/wget                ]; then apt install -y apt install -y wget;                      fi


echo "" > /tmp/1;
}

HOST_DEBIAN_BLACKLIST_NOUVEAU(){
cat > /etc/modprobe.d/blacklist-nouveau.conf << EOF
blacklist nouveau
options nouveau modeset=0
EOF
/usr/sbin/update-initramfs -u;
}

HOST_DEBIAN_NVIDIA(){
apt install nvidia-detect;
}


HOST_DEBIAN_NVIDIA_CUDA(){
apt install -y aptnvidia-cuda-toolkit
apt install -y aptnvidia-cuda-toolkit-gcc
#apt install -y apt nvidia-cuda-dev
#apt install -y apt nvidia-cuda-gdb
#apt install -y apt nvidia-cuda-mps
#apt install -y apt nvidia-cuda-samples
#apt install -y apt nvidia-cuda-toolkit-doc
}
