yes | mkfs -t ext4 ${device_name}
mkdir ${volume_name}
mount ${device_name} ${volume_name}
cp /etc/fstab /etc/fstab.bak
echo '${device_name}  ${volume_name}   ext4   defaults   0   0' > /etc/fstab
mount

