#!/bin/bash

df -H | grep scinia1
if [ $? -eq 0 ]; then
  echo "scinia1 already found" >> /tmp/schelper.log
  exit 1
fi

while [ ! -d /sys/block/scinia/ ] ;
do
  echo "scinia does not exist yet" >> /tmp/schelper.log
  sleep 2
done


echo "moving on" >> /tmp/schelper.log
echo -e "o\nn\np\n1\n\n\nw" | fdisk /dev/scinia
mkfs.xfs /dev/scinia1 && sleep 1
mount /dev/scinia1 /var/lib/docker

cat /etc/fstab | grep scinia1
if [ $? -eq 0 ]; then
  echo "fstab statement already exits"
  exit 0
fi

echo '/dev/scinia1              /var/lib/docker           xfs    defaults        1 2' >> /etc/fstab
systemctl enable docker.service
systemctl start docker.service
