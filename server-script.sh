#! /bin/bash

sudo yum install java-1.8.0-openjdk-devel -y
sudo yum install git -y
sudo yum install maven -y

if [-d "addressbook"]
then 
    echo "repo is already cloned snd exists"
    cd /home/ec2-user/addressbook
    git pull origin master
else
    git clone https://github.com/aragit15/addressbook.git 
    git checkout master
    git pull origin master
fi
cd addressbook
mvn package       