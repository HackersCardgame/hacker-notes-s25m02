

modprobe nbd

qemu-nbd --connect=/dev/nbd0 /var/lib/libvirt/images/coweeeeeeeee.qcow2

echo any key
read

partprobe /dev/ndb0

lsblk /dev/nbd0

echo "dann unmount mit 

umount /mnt
qemu-nbd --disconnect /dev/nbd0

"

