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
wget -q https://fr.download.nvidia.com/XFree86/Linux-x86_64/$RELEASE_NVIDIA/NVIDIA-Linux-x86_64-$RELEASE_NVIDIA.run -O /tmp/NVIDIA-Linux-x86_64.run;
ls /tmp/NVIDIA-Linux-x86_64.run;
bash /tmp/NVIDIA-Linux-x86_64.run;
}
