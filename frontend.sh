
print_head() {
  echo -e "\e[35m$*\e[0m"

print_head disable nginx
dnf module disable nginx -y >/tmp/roboshop.log
dnf module enable nginx:1.24 -y >/tmp/roboshop.log
print_head install nginx >/tmp/roboshop.log
dnf install nginx -y >/tmp/roboshop.log

cp nginx.conf /etc/nginx/nginx.conf >/tmp/roboshop.log

rm -rf /usr/share/nginx/html/*
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend-v3.zip
cd /usr/share/nginx/html
unzip /tmp/frontend.zip

print_head menable nginx
systemctl enable nginx
systemctl start nginx
systemctl restart nginx
}