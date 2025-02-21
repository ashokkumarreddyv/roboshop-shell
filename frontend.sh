echo -e "\e[35mdisable nginx\e[0m"
dnf module disable nginx -y
dnf module enable nginx:1.24 -y
echo -e "\e[37install nginx\e[0m"
dnf install nginx -y

cp nginx.conf /etc/nginx/nginx.conf

rm -rf /usr/share/nginx/html/*
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend-v3.zip
cd /usr/share/nginx/html
unzip /tmp/frontend.zip

echo -e "\e[36menable nginx\e[0m"
systemctl enable nginx
systemctl start nginx
systemctl restart nginx