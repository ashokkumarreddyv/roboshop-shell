
demon_setup() {

systemctl daemon-reload
systemctl enable $component
systemctl restart $component

}

artifact_download() {
rm -rf /app
mkdir /app
curl -o /tmp/$component.zip https://roboshop-artifacts.s3.amazonaws.com/$component-v3.zip
cd /app
unzip /tmp/$component.zip

}

nodejs_user() {
    dnf module disable nodejs -y
    dnf module enable nodejs:20 -y
    dnf install nodejs -y

    cp catalogue.service /etc/systemd/system/catalogue.service
    cp mongo.repo /etc/yum.repos.d/mongo.repo

    useradd roboshop

}