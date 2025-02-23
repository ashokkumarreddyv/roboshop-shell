
print_head() {
  echo -e "\e[32;5m$*\e[25;0m"
# echo -e "\e[5m$*\e[25m"

  echo "*********************"
}

source common.sh

print_head disable nginx
dnf module disable nginx -y
exit_status $?
print_head enable nginx
dnf module enable nginx:1.24 -y
exit_status $?
print_head install nginx
dnf install nginx -y
exit_status $?

cp nginx.conf /etc/nginx/nginx.conf

rm -rf /usr/share/nginx/html/*
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend-v3.zip
cd /usr/share/nginx/html
unzip /tmp/frontend.zip

print_head enable nginx
systemctl enable nginx
exit_status $?
print_head start nginx
systemctl start nginx
systemctl restart nginx
exit_status $?
