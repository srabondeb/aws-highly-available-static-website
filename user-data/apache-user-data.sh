#!/bin/bash

yum update -y
yum install -y httpd git

systemctl enable httpd
systemctl start httpd

rm -rf /var/www/html/*

cd /tmp
git clone https://github.com/srabondeb/aws-highly-available-static-website.git

cp -r /tmp/aws-highly-available-static-website/website/* /var/www/html/

chmod -R 755 /var/www/html

systemctl restart httpd
