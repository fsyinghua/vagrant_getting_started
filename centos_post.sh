#/bin/sh

# install some tools
sudo yum install -y epel-release git vim gcc glibc-static telnet

# open password auth for backup if ssh key doesn't work, bydefault, username=vagrant password=vagrant
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sudo systemctl restart sshd

# disable firewall and selinux
setenforce 0
sudo sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
systemctl stop firewalld.service && systemctl disable firewalld.service


# install ansible
if [ "$HOSTNAME" = "ansible-controller" ]; then
    sudo yum install -y ansible
fi

# edit host file

sudo sh -c "echo 192.168.85.10 ansible-controller >> /etc/hosts"
sudo sh -c "echo 192.168.85.11 ansible-node1 >> /etc/hosts"
sudo sh -c "echo 192.168.85.12 ansible-node2 >> /etc/hosts"
