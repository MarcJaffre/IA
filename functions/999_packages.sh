############################################################################################################################
# Installation de paquet
############################################################################################################################
#
#
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

############################################################################################################################
# Mise à jour du système #
##########################
HOST_DEBIAN_APT_UPDATE(){
/usr/bin/apt update 1>/dev/null;
}

############################################################################################################################
# Mise à niveau du système #
############################
HOST_DEBIAN_APT_UPGRADE(){
DEBIAN_FRONTEND=noninteractive /usr/bin/apt upgrade -y;
}

############################################################################################################################
# Installation des paquets de base #
####################################
HOST_DEBIAN_APT_INSTALL_BASE(){
# Tool
# ====================================================================================================================
echo "Installation de APT-FILE";
if [ ! -d /usr/share/apt-file                ]; then apt install -y apt-file                     1>/dev/null; fi

echo "Installation de BTOP";
if [ ! -d /usr/share/doc/btop                ]; then apt install -y btop                         1>/dev/null; fi

echo "Installation de CURL";
if [ ! -d /usr/share/doc/curl                ]; then apt install -y curl                         1>/dev/null; fi

echo "Installation de DOSFSTOOLS";
if [ ! -d /usr/share/doc/dosfstools          ]; then apt install -y dosfstools                   1>/dev/null; fi

echo "Installation de GNUPG2";
if [ ! -d /usr/share/doc/gnupg2              ]; then apt install -y gnupg2                       1>/dev/null; fi

echo "Installation de PCIUTILS";
if [ ! -d /usr/share/doc/pciutils            ]; then apt install -y pciutils                     1>/dev/null; fi

echo "Installation de TREEE";
if [ ! -d /usr/share/doc/tree                ]; then apt install -y tree                         1>/dev/null; fi

echo "Installation de WGET";
if [ ! -d /usr/share/doc/wget                ]; then apt install -y wget                         1>/dev/null; fi
}

############################################################################################################################
# Installation des paquets Dependances #
########################################
HOST_DEBIAN_APT_INSTALL_DEPENDANCE(){
# ====================================================================================================================
# LLAMA
echo "Installation de CMAKE";
if [ ! -d /usr/share/cmake                   ]; then apt install -y cmake;                      1>/dev/null; fi
# --------
echo "Installation de CCACHE";
if [ ! -d /usr/share/doc/ccache              ]; then apt install -y ccache;                     1>/dev/null; fi
# --------
echo "Installation de LIBSSL-DEV";
if [ ! -d /usr/share/doc/libssl-dev          ]; then apt install -y libssl-dev;                 1>/dev/null; fi
# --------
echo "Installation de OPENSSL";
if [ ! -d /usr/share/doc/openssl             ]; then apt install -y openssl;                    1>/dev/null; fi
# --------
# ====================================================================================================================
echo "Installation de BUILD-ESSENTIAL";
if [ ! -d /usr/share/build-essential         ]; then apt install -y build-essential;            1>/dev/null; fi
# --------
echo "Installation de LINUX-HEADERS";
if [ ! -d /usr/src/linux-headers-$(uname -r) ]; then apt install -y linux-headers-$(uname -r);  1>/dev/null; fi
# --------
#echo "Installation de PYTHON3-FULL";
#if [ ! -d /usr/share/doc/python3-full        ]; then apt install -y python3-full;               1>/dev/null; fi
# --------
#echo "Installation de Python3-pip";
#if [ ! -f /usr/bin/pip3                      ]; then apt install -y python3-pip;                1>/dev/null; fi

# ====================================================================================================================
# Bookworm
#if [ "$VERSION_ID" = "12" ]; then
#if [ ! -d /usr/share/doc/python3.11          ]; then apt install -y python3.11;                 1>/dev/null; fi
#if [ ! -d /usr/share/doc/python3.11-venv     ]; then apt install -y python3.11-venv;            1>/dev/null; fi
#fi
# ====================================================================================================================
# Trixies
#if [ "$VERSION_ID" = "13" ]; then
#if [ ! -d /usr/share/doc/python3.13          ]; then apt install -y python3.13;                 1>/dev/null; fi
#if [ ! -d /usr/share/doc/python3.13-venv     ]; then apt install -y python3.13-venv;            1>/dev/null; fi
#fi
# ====================================================================================================================
# Bypass Erreur
echo "" > /tmp/Test;
# ====================================================================================================================
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
