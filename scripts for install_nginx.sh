#!/bin/bash
sudo apt update -y
sudo apt install -y nginx
sudo systemctl start nginx
sudo systemctl enable nginx
echo "Hello using terraform install nginx!" | sudo tee /var/www/html/index.html
