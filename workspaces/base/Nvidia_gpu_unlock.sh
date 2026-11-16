#!/usr/bin/bash

if [ -d /tmp/gpu-ulonkc ]; then
   git clone https://github.com/Zagitta/gpu-unlock /tmp/gpu-unlock;
   cd /tmp/gpu-unlock;
   make install;
   sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT=.*/GRUB_CMDLINE_LINUX_DEFAULT=\"gpu_unlock.targets=all\"/' /etc/default/grub;
   grep GRUB_CMDLINE_LINUX_DEFAULT /etc/default/grub;
   /usr/sbin/update-grub;
fi
