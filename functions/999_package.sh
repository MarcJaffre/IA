############################################################################################################################
# Installation des paquets manquants
############################################################################################################################


############################################################################################################################
# Fondamentaux #
################
HOST_DEBIAN_APT_REPO(){
# trixie-updates, to get updates before a point release is made
if [[ $VERSION_CODENAME == "trixie" || $VERSION_CODENAME == "bookworm"  ]]; then
cat > /etc/apt/sources.list << EOF
# =======================================================================================================
# https://www.debian.org/doc/manuals/debian-reference/ch02.en.html#_updates_and_backport                #
# =======================================================================================================
deb http://ftp.fr.debian.org/debian/            $VERSION_CODENAME          main non-free non-free-firmware contrib #
# =======================================================================================================
deb http://ftp.fr.debian.org/debian/            $VERSION_CODENAME-updates  main non-free non-free-firmware contrib #
# =======================================================================================================
deb http://security.debian.org/debian-security  $VERSION_CODENAME-security main non-free non-free-firmware contrib #
# =======================================================================================================
EOF
fi

if [[ $VERSION_CODENAME == "bullseye" ]]; then
cat > /etc/apt/sources.list << EOF
# =======================================================================================================
deb http://ftp.fr.debian.org/debian/            $VERSION_CODENAME          main non-free contrib                 #
# =======================================================================================================
deb http://ftp.fr.debian.org/debian/            $VERSION_CODENAME-updates  main non-free contrib                 #
# =======================================================================================================
deb http://security.debian.org/debian-security  $VERSION_CODENAME-security main non-free contrib                 #
# =======================================================================================================
# https://www.debian.org/doc/manuals/debian-reference/ch02.en.html#_updates_and_backport                #
# =======================================================================================================
EOF
fi

}


HOST_DEBIAN_APT_UPDATE(){
/usr/bin/apt update 1>/dev/null;
}
HOST_DEBIAN_APT_INSTALL_DEPENDANCE(){

# LLAMA
if [ ! -d /usr/share/doc/btop                ]; then apt install -y btop;                       fi
if [ ! -d /usr/share/build-essential         ]; then apt install -y build-essential;            fi
if [ ! -d /usr/share/doc/ccache              ]; then apt install -y ccache;                     fi
if [ ! -d /usr/share/cmake                   ]; then apt install -y cmake;                      fi
if [ ! -d /usr/share/doc/curl                ]; then apt install -y curl;                       fi
if [ ! -d /usr/share/doc/gnupg2              ]; then apt install -y gnupg2;                     fi
if [ ! -d /usr/src/linux-headers-$(uname -r) ]; then apt install -y linux-headers-$(uname -r);  fi
if [ ! -d /usr/share/doc/openssl             ]; then apt install -y openssl;                    fi
if [ ! -d /usr/share/doc/libssl-dev          ]; then apt install -y libssl-dev;                 fi
if [ ! -d /usr/share/doc/pciutils            ]; then apt install -y pciutils;                   fi
if [ ! -d /usr/share/doc/tree                ]; then apt install -y tree;                       fi
if [ ! -d /usr/share/doc/wget                ]; then apt install -y wget;                       fi

# OpenWebui
#if [ ! -d /usr/share/doc/python3.13          ]; then apt install -y python3.13;                 fi


# Bypass Erreur
echo "" > $WORKDIR/Test;
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
