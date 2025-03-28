#!/bin/bash

# update
sudo apt update -y

# upgrade
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -yq

# install nginx
sudo apt install nginx -y

# restart nginx
sudo systemctl restart nginx

# enable nginx
sudo systemctl enable nginx

# replace default config file
sudo tee /etc/nginx/sites-available/default > /dev/null <<'EOF'
server {
    listen 80;
    server_name _;

    location / {
        proxy_pass http://localhost:3000;
    }
}
EOF


# check if config file works
sudo nginx -t 

# restart nginx
sudo systemctl restart nginx

# get app code - cannot use scp! (hint: use github and git)
git clone https://github.com/SymBains/Sparta-Test-App.git

# install nodejs version 20.x
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - &&\
sudo apt-get install -y nodejs

# check version
node -v

# cd into app directory inside the cloned repo
cd Sparta-Test-App/app

# install app
sudo npm install

# start app in background safely
nohup npm start > app.log 2>&1 &

echo "App started and running in the background"

