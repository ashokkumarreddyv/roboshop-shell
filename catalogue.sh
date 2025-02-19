component=catalogue
source common.sh
dnf module disable nodejs -y
dnf module enable nodejs:20 -y
dnf install nodejs -y

cp catalogue.service /etc/systemd/system/catalogue.service
cp mongo.repo /etc/yum.repos.d/mongo.repo
useradd roboshop
rm -rf app
mkdir /app
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue-v3.zip
rm -rf app
cd /app
unzip /tmp/catalogue.zip
cd /app
npm install


demon_setup
cp mongo.repo /etc/yum.repos.d/mongo.repo
mongosh --host localhost </app/db/master-data.js
