#!/usr/bin/bash

######################################################
# IL NECESSITE PAS MAL DE CPU LORS DE LA COMPILATION #
######################################################

if [ -d /tmp/gpu-unlock ]; then
 rm -rf /tmp/gpu-unlock;
fi


if [ ! -d /tmp/gpu-unlock ]; then
   git clone --quiet https://github.com/Zagitta/gpu-unlock /tmp/gpu-unlock;
   cd /tmp/gpu-unlock;
   make install;
   #sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT=.*/GRUB_CMDLINE_LINUX_DEFAULT=\"gpu_unlock.targets=all\"/' /etc/default/grub;
   #grep GRUB_CMDLINE_LINUX_DEFAULT /etc/default/grub;
   #/usr/sbin/update-grub;
fi

# https://github.com/Drthrax74/Linux/blob/main/Debian/Bookworm/Appz/Pilote/Unlock-GPU.md
# /root/.cache/gpu-unlock/inputs/NVIDIA-kernel-module-source-610.43.03.tar.xz
