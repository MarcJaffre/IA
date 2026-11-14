### Agrandir le /tmp

```bash
clear;
if ! grep -q tmpfs /etc/fstab; then
   echo "tmpfs                                           /tmp            tmpfs           defaults,size=5G    0 0" >> /etc/fstab
   umount -l /tmp
   systemctl daemon-reload;
   mount -a
fi
```


