#! /bin/bash

sudo yum update -y

#Install java
sudo yum -y install java-1.8.0-openjdk-devel.x86_64

#Install Ansible
#sudo amazon-linux-extras install ansible2 -y

#sudo yum install python-pip -y
#sudo pip install docker-py

sudo pip install docker-py
sudo pip install ansible --no-cache-dir
ansible-galaxy collection install community.general
#ansible-galaxy collection install community.general


#Install Git
sudo yum install git -y
#Install Jenkins
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
sudo yum install jenkins --nogpgcheck -y
sudo service jenkins start
sudo echo  'jenkins ALL=(ALL) NOPASSWD:ALL' >>  /etc/sudoers.d/90-cloud-init-users

#Copy ssh key
#sudo cp ../Data/LinuxKeyPair.pem >> /home/ec2-user/.ssh/authorized_keys

#/usr/lib/python2.7/site-packages
#/usr/bin/python
