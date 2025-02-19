
demon_setup() {

systemctl daemon-reload
systemctl enable $component
systemctl restart $component

}

artifact_download() {
rm -rf /app
mkdir /app
curl -o /tmp/$component.zip https://roboshop-artifacts.s3.amazonaws.com/$component-v3.zip
rm -rf /app
cd /app
unzip /tmp/$component.zip

}