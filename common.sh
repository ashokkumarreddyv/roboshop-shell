
demon_setup() {

systemctl daemon-reload
systemctl enable $component
systemctl restart $component
echo $?

}

artifact_download() {
rm -rf /app
mkdir /app
curl -o /tmp/$component.zip https://roboshop-artifacts.s3.amazonaws.com/$component-v3.zip
cd /app
unzip /tmp/$component.zip

}

nodejs_user() {

     print_head disable nodejs
    dnf module disable nodejs -y
    echo $?
    dnf module enable nodejs:20 -y
    echo $?
    dnf install nodejs -y
    echo $?

    cp catalogue.service /etc/systemd/system/catalogue.service
    cp mongo.repo /etc/yum.repos.d/mongo.repo

    useradd roboshop
    echo $?

}