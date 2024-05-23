umount -d ${device_name}
head -n -1 /etc/fstab > /etc/fstab.bak
mv /etc/fstab.bak /etc/fstab
rm -rf ${volume_name}