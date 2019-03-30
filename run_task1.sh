#!/bin/bash
sudo yum install gcc make -y
cd ..
wget http://download.redis.io/redis-stable.tar.gz
tar xvzf redis-stable.tar.gz
cd redis-stable
make
sudo make /etc/redis
sudo mkdir /etc/redis
sudo mkdir /var/redis
sudo cp utils/redis_init_script /etc/init.d/redis_6379
sudo cp redis.conf /etc/redis/6379.conf
sudo mkdir /var/redis/6379
sudo cp src/redis-cli /usr/local/bin
echo "redis-cli is installen on local machine"


sudo yum install docker -y
sudo service docker start
echo "docker application is installed and started"
cd ../nodejs-task1/
sudo docker network create redis
sudo docker build -t my-nodejs-app .
sudo docker run -d  --net "redis" --name redis-server -p 6379:6379 redis
sudo docker run -d --name my-running-app --net "redis" -p 9090:9090 --link redis-server:redis my-nodejs-app

echo "check web app in browser yourIP:9090"
echo "to check redis run  redis-cli and then get count"
