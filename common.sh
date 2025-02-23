
demon_setup() {

systemctl daemon-reload
systemctl enable $component
systemctl restart $component
exit_status $?

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
    exit_status $?

    dnf install nodejs -y
    exit_status $?

    cp catalogue.service /etc/systemd/system/catalogue.service
    cp mongo.repo /etc/yum.repos.d/mongo.repo

    useradd roboshop
    exit_status $?

}

exit_status() {
       if [ $1 -eq 0 ]; then
        echo -e "\e[32m >>success\e[0m"
       else
        echo -e "\e[31m >>failure\e[0m"
        exit
       fi


}