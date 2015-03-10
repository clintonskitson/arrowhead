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
echo -e "n\np\n1\n\n\n\nw" | fdisk /dev/scinia >> /tmp/schelper.log

mkfs.ext4 /dev/scinia1 >> /tmp/schelper.log

cp /opt/schelper/var-lib-docker.mount /usr/lib/systemd/system/.

rm -Rf /var/lib/docker
mkdir /var/lib/docker

systemctl daemon-reload

systemctl enable var-lib-docker.mount >> /tmp/schelper.log
systemctl start var-lib-docker.mount >> /tmp/schelper.log

systemctl enable docker.service >> /tmp/schelper.log
systemctl start docker.service >> /tmp/schelper.log

df >> /tmp/schelper.log
