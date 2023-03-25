#!/usr/bin/env bash

######### docker images ########
# peek
sudo docker images

# build docker image, run in the {repo_folder}
sudo docker build -t aleni-dev-ubuntu .

# remove docker image
sudo docker rmi aleni-dev-ubuntu

########## containers #########
# peek
sudo docker ps -a

# run the docker container
sudo docker run -it --name=aleni-dev ubuntu:jammy
sudo docker run -dp 5901:5901 --name=aleni-dev aleni-dev-ubuntu

# attach to a running container and open an iteractive terminal
sudo docker exec -it aleni-dev /bin/bash

# stop and remove the docker container
sudo docker stop aleni-dev
sudo docker rm aleni-dev



