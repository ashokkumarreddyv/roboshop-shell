component=catalogue
source common.sh
nodejs_user

mkdir /app
curl -o /tmp/$component.zip https://roboshop-artifacts.s3.amazonaws.com/$component-v3.zip
cd /app
unzip /tmp/$component.zip

cd /app
npm install


demon_setup
cp mongo.repo /etc/yum.repos.d/mongo.repo
mongosh --host localhost </app/db/master-data.js

