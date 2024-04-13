#!/bin/bash
sudo yum update -y

sudo yum install -y wget 
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade -y
sudo yum install java-11* -y
sudo yum install jenkins -y
sudo systemctl enable jenkins
echo "intial jenkins Admin Password"
sudo systemctl start jenkins
sudo cat /var/lib/jenkins/secrets/initialAdminPassword  

