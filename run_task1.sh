#!/bin/bash
sudo yum install docker -y
sudo service docker start
echo "docker application is installed and started"

sudo docker network create redis
sudo docker build -t my-nodejs-app .
sudo docker run -d  --net "redis" --name redis-server -p 6379:6379 redis
sudo docker run -d --name my-running-app --net "redis" -p 9090:9090 --link redis-server:redis my-nodejs-app

echo "check web app in browser yourIP:9090"
echo "to check redis run  sudo docker exec -it redis-server /bin/bash"
echo "get count"
