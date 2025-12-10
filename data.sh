#!/bin/bash

apt update -y

PASSWORD=$(openssl rand -base64 12)

HASH=$(openssl passwd -6 "$PASSWORD")

useradd -m -s /bin/bash adminuser
usermod -p "$HASH" adminuser
usermod -aG sudo adminuser

echo "adminuser password: $PASSWORD" > /root/adminuser_password.txt
chmod 600 /root/adminuser_password.txt

sed -i 's/^#PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
sed -i 's/^#KbdInteractiveAuthentication.*/KbdInteractiveAuthentication yes/' /etc/ssh/sshd_config
sed -i 's/^PermitEmptyPasswords.*/PermitEmptyPasswords no/' /etc/ssh/sshd_config

useradd -m -s /bin/bash poweruser
passwd -d poweruser

echo "poweruser ALL=(ALL) NOPASSWD: /usr/sbin/iptables" > /etc/sudoers.d/poweruser
chmod 440 /etc/sudoers.d/poweruser

chmod 750 /home/adminuser
chgrp poweruser /home/adminuser

ln -s /etc/mtab /home/poweruser/mtab-link
chown poweruser:poweruser /home/poweruser/mtab-link

systemctl restart sshd
