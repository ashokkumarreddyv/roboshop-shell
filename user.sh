print_hear(){
 echo -e "\e[34m$*\e[0m"

}


component=user
source common.sh

print_head disable nodejs
dnf module disable nodejs -y

print_head enable nodejs
dnf module enable nodejs:20 -y

print_head install nodejs
dnf install nodejs -y
cp user.service /etc/systemd/system/user.service
useradd roboshop

artifact_download

cd /app

print_head install npm
npm install

demon_setup