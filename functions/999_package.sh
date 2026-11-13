############################################################################################################################
# Installation des paquets manquants
############################################################################################################################


############################################################################################################################
# Fondamentaux
HOST_DEBIAN_APT_UPDATE(){
/usr/bin/apt update 1>/dev/null;
}
HOST_DEBIAN_APT_INSTALL_DEPENDANCE(){
if [ ! -d /usr/share/doc/btop                ]; then apt install -y btop;                       fi
if [ ! -d /usr/share/build-essential         ]; then apt install -y build-essential;            fi
if [ ! -d /usr/share/cmake                   ]; then apt install -y cmake;                      fi
if [ ! -d /usr/share/doc/curl                ]; then apt install -y curl;                       fi
if [ ! -d /usr/share/doc/gnupg2              ]; then apt install -y gnupg2;                     fi
if [ ! -d /usr/src/linux-headers-$(uname -r) ]; then apt install -y linux-headers-$(uname -r);  fi
if [ ! -d /usr/share/doc/openssl             ]; then apt install -y openssl;                    fi
if [ ! -d /usr/share/doc/libssl-dev          ]; then apt install -y libssl-dev;                 fi
if [ ! -d /usr/share/doc/pciutils            ]; then apt install -y pciutils;                   fi
if [ ! -d /usr/share/doc/tree                ]; then apt install -y tree;                       fi
if [ ! -d /usr/share/doc/wget                ]; then apt install -y wget;                       fi
echo "" > /tmp/1;
}

############################################################################################################################
# Blacklist Pilote Libre #
##########################
HOST_DEBIAN_BLACKLIST_NOUVEAU(){
cat > /etc/modprobe.d/blacklist-nouveau.conf << EOF
blacklist nouveau
options nouveau modeset=0
EOF
/usr/sbin/update-initramfs -u 1>/dev/null;
}

############################################################################################################################
# Déploiement des pilotes Nvidia #
##################################
HOST_DEBIAN_NVIDIA(){
if [ ! -d /usr/share/bug/nvidia-detect           ]; then apt install -y nvidia-detect;           fi
if [ ! -d /usr/share/doc/nvidia-driver           ]; then apt install -y nvidia-driver;           fi
if [ ! -d /usr/share/doc/nvidia-settings         ]; then apt install -y nvidia-settings;         fi
}

############################################################################################################################
# Déploiement de Nvidia Cuda Toolkit #
######################################
HOST_DEBIAN_NVIDIA_CUDA(){
if [ ! -d /usr/lib/nvidia-cuda-toolkit           ]; then apt install -y nvidia-cuda-toolkit;     fi
if [ ! -d /usr/share/doc/nvidia-cuda-toolkit-gcc ]; then apt install -y nvidia-cuda-toolkit-gcc; fi
#apt install -y apt nvidia-cuda-dev
#apt install -y apt nvidia-cuda-gdb
#apt install -y apt nvidia-cuda-mps
#apt install -y apt nvidia-cuda-samples
#apt install -y apt nvidia-cuda-toolkit-doc
}
