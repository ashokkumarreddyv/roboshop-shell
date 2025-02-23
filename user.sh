print_head(){
 echo -e "\e[36m$*\e[0m"

}


component=user
source common.sh

print_head disable nodejs
dnf module disable nodejs -y
echo $?

print_head enable nodejs
dnf module enable nodejs:20 -y
echo $?

print_head install nodejs
dnf install nodejs -y
echo $?
cp user.service /etc/systemd/system/user.service
useradd roboshop
echo $?

artifact_download

cd /app

print_head install npm
npm install
echo $?

demon_setup
echo $?