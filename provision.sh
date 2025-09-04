#!/bin/bash
# Provision script for automated finance website setup

echo "📦 Installing required packages..."
yum install httpd wget unzip vim -y

echo "🌐 Starting and enabling Apache..."
systemctl start httpd
systemctl enable httpd

echo "📂 Downloading finance template..."
mkdir -p /tmp/finance
cd /tmp/finance
wget https://www.tooplate.com/zip-templates/2135_mini_finance.zip
unzip -o 2135_mini_finance.zip

echo "📂 Deploying website..."
cp -r 2135_mini_finance/* /var/www/html/

echo "🔄 Restarting Apache..."
systemctl restart httpd

echo "🧹 Cleaning up temporary files..."
cd /tmp
rm -rf /tmp/finance

echo "🔥 Disabling firewall..."
systemctl stop firewalld
systemctl disable firewalld

echo "✅ Provisioning complete! Access the site at http://192.168.56.28"
