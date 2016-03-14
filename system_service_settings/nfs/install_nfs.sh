#!/bin/bash 
# 安装NFS服务和配置 

apt-get install nfs-kernel-server -y 

[ -d /nfs ] || ( mkdir -p /nfs && echo "mkdir /nfs" )
chmod 0777 /nfs 


if [ ! -f /etc/exports ]
then
    echo "Create /etc/exports"
    touch /etc/exports 
fi

echo '/nfs *(rw,sync,no_root_squash)' >> /etc/exports 

echo Restart NFS server 
/etc/init.d/rpcbind restart 
/etc/init.d/nfs-kernel-server restart 

echo Test NFS server 

mount -t nfs localhost:/nfs /mnt 
test_str=`df | grep nfs`
if [ x"$test_str" != x"" ]
then
    echo "Install NFS server Successful."
    umount /mnt 
    exit 0
else
    echo "Install NFS server Failed."
    echo "Please manually install the NFS server."
    exit 1
fi

