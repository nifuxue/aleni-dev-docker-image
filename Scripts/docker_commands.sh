#!/usr/bin/env bash

######### docker images ########
# peek
sudo docker images

# build docker image, run in the {repo_folder}
sudo docker build -t aleni-dev-ubuntu:added-user .

# remove docker image
sudo docker rmi aleni-dev-ubuntu:added-user

########## containers #########
# peek
sudo docker ps -a

# run the docker container
sudo docker run -it --name=aleni-dev ubuntu:jammy
sudo docker run -it --name=aleni-dev aleni-dev-ubuntu:added-user

# stop and remove the docker container
sudo docker stop aleni-dev
sudo docker rm aleni-dev

# attach to a running container and open an iteractive terminal
sudo docker exec -it aleni-dev /bin/bash


