# Automated Deployment Script for Node.js App with Nginx Reverse Proxy

## Overview
This Bash script automates the installation and setup of an Nginx reverse proxy for a Node.js application. The script ensures the application runs on an IP address without needing to specify a port.

## Features
- Install Nginx and configures it as a reverse proxy
- Installs Node.js 20.x
- Clones the app from a github repo
- Starts the app and runs in the background

## Prerequisites
Ensure you have a fresh Ubuntu server before running this script. 

## Installation & Usage
1. Run the following command to make the script.
```bash
nano setup.sh
```

2. Copy and paste the following script and save using `control +x` followed by `y` and `enter`

```bash
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
```

3.  Make the script executable & run it using:
```bash
chmod +x setup.sh
./setup.sh
```

**The App should now have started and be running in the background**


