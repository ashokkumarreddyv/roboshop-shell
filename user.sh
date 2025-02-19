component=user
source common.sh

dnf module disable nodejs -y
dnf module enable nodejs:20 -y
dnf install nodejs -y
cp user.service /etc/systemd/system/user.service
useradd roboshop


mkdir /app
curl -o /tmp/$component.zip https://roboshop-artifacts.s3.amazonaws.com/$component-v3.zip

cd /app
unzip /tmp/$component.zip

cd /app
npm install

demon_setup