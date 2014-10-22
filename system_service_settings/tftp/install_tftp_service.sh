#!/bin/bash 
#filename: install_tftp_service.sh 

sudo apt-get install tftpd tftp xinetd 

sudo cat > /etc/xinetd.d/tftp << END
service tftp 
{ 
socket_type = dgram 
protocol = udp 
wait = yes 
user = root 
server = /usr/sbin/in.tftpd 
server_args = -s /tftpboot 
disable = no 
per_source = 11 
cps = 100 2 
flags = IPv4 
} 
END

sudo mkdir /tftpboot 
sudo chmod 777 /tftpboot 

# restart service 
sudo /etc/init.d/xinetd restart 

netstat -a | grep tftp 

if [ $? -eq 0 ];then
	echo "Install tftp service successed !!!"
else
	echo "Install tftp service failed !!!"
	exit 1
fi

exit 0

