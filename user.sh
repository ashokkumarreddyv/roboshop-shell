print_head(){
 echo -e "\e[36m$*\e[0m"

}


component=user
source common.sh

print_head disable nodejs
dnf module disable nodejs -y
exit_status $?

print_head enable nodejs
dnf module enable nodejs:20 -y
exit_status $?

print_head install nodejs
dnf install nodejs -y
exit_status $?
cp user.service /etc/systemd/system/user.service
print_head application user

id roboshop
if [ $? - ne 0]; then
  useradd roboshop
fi

exit_status $?

artifact_download

cd /app

print_head install npm
npm install
exit_status $?

demon_setup
exit_status $?