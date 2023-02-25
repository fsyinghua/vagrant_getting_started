#/bin/sh

# install some tools
sudo apt update
sudo apt install -y git vim gcc telnet net-tools

# open password auth for backup if ssh key doesn't work, bydefault, username=vagrant password=vagrant
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sudo systemctl restart sshd


sudo ufw disable



# install ansible


# edit host file

sudo sh -c "echo 192.168.85.10 ansible-controller >> /etc/hosts"
sudo sh -c "echo 192.168.85.11 ansible-node1 >> /etc/hosts"
sudo sh -c "echo 192.168.85.12 ansible-node2 >> /etc/hosts"
