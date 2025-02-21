
print_head() {
  echo -e "\e[32;5m$*\e[25;0m"
# echo -e "\e[5m$*\e[25m"

  echo "*********************"
}

log_file=/tmp/roboshop.log/out


print_head disable nginx
dnf module disable nginx -y
print_head enable nginx
dnf module enable nginx:1.24 -y &>> $log_file
print_head install nginx
dnf install nginx -y &>> $log_file

cp nginx.conf /etc/nginx/nginx.conf

rm -rf /usr/share/nginx/html/*
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend-v3.zip &>> $log_file
cd /usr/share/nginx/html
unzip /tmp/frontend.zip &>> $log_file

print_head enable nginx
systemctl enable nginx &>> $log_file
print_head start nginx
systemctl start nginx &>> $log_file
systemctl restart nginx &>> $log_file
