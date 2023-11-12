#!/bin/bash

#Uninstall Unofficial versions 

for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt remove $pkg -y; done

##################################  Set up Docker's Apt repository. ###########################
# Add Docker's official GPG key:
sudo apt-get update -y
sudo apt-get install ca-certificates curl gnupg -y
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg 

# Add the repository to Apt sources:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y


#install the Docker packages. 

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y


# Start and Enable Docker 
sudo service docker start
sudo service docker enable

#Add user cyber to docker group and Update Docker Permission 
sudo usermod -a -G docker cyber
sudo chmod 666 /var/run/docker.sock

# Run OWASP Juice Shop Container

docker pull bkimminich/juice-shop
docker run -d -p 80:3000 bkimminich/juice-shop