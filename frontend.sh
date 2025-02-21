
print_head() {
  echo -e "\e[35m$*\e[0m"

print_head disable nginx
dnf module disable nginx -y
dnf module enable nginx:1.24 -y
print_head install nginx
dnf install nginx -y

cp nginx.conf /etc/nginx/nginx.conf

rm -rf /usr/share/nginx/html/*
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend-v3.zip
cd /usr/share/nginx/html
unzip /tmp/frontend.zip

print_head menable nginx
systemctl enable nginx
systemctl start nginx
systemctl restart nginx
}