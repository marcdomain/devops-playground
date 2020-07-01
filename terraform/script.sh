#!/bin/bash

apt-get update

# install NodeJS
curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt-get install -y nodejs

# set up repository
git clone https://github.com/marcdomain/basic-express-app.git
cd basic-express-app
npm install

# setup NGINX
config_server="
  server  {
    listen 80;
    location / {
      proxy_pass http://127.0.0.1:3000;
    }
  }
"
sudo apt-get install nginx -y
sudo rm -r /etc/nginx/sites-enabled/default
sudo echo ${config_server} > /etc/nginx/sites-available/marcdomain
sudo ln -s /etc/nginx/sites-available/marcdomain /etc/nginx/sites-enabled/marcdomain
sudo service nginx restart

# install PM2
sudo npm install pm2 -g

# start server with PM2 to keep the server alive
pm2 start npm --name "basic-express-app" -- start
