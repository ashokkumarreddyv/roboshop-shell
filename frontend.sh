
print_head() {
  echo -e "\e[35m$*\e[0m"
  echo "*********************" >> $log_file
}

log_file=/tmp/roboshop.log


print_head disable nginx
dnf module disable nginx -y >> $log_file
dnf module enable nginx:1.24 -y >> $log_file
print_head install nginx >> $log_file
dnf install nginx -y >> $log_file

cp nginx.conf /etc/nginx/nginx.conf >> $log_file

rm -rf /usr/share/nginx/html/*
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend-v3.zip >> $log_file
cd /usr/share/nginx/html
unzip /tmp/frontend.zip >> $log_file

print_head menable nginx >> $log_file
systemctl enable nginx >> $log_file
systemctl start nginx >> $log_file
systemctl restart nginx >> $log_file
