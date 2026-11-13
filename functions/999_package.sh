HOST_DEBIAN_APT(){
apt install -y build-essential;
apt install -y cmake;
apt install -y curl;
apt install -y linux-headers-$(uname -r);
apt install -y pciutils;
apt install -y wget;
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
}
