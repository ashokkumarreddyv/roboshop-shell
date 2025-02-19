component=catalogue
source common.sh
nodejs_user

artifact_download

cd /app
npm install


demon_setup
cp mongo.repo /etc/yum.repos.d/mongo.repo
mongosh --host localhost </app/db/master-data.js
