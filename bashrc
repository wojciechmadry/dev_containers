#!/bin/bash

# Create container or connect if exists
d_con () {
  imageName=$1
  if [ -z "$imageName" ];
  then
    echo "Function must be called with argument"
    return 1
  fi
  xhost +local:docker
  isExist=$(docker ps -all | grep "$imageName")
  if [ -z "$isExist" ];
	then
    docker run -it --privileged=true --net=host --env="DISPLAY" -v /tmp/.X11-unix:/tmp/.X11-unix:rw -v /dev:/dev "$imageName"
	else
    containerName=$(echo "$isExist" | awk '{print $NF}')
    docker start "$containerName"
    docker exec -it "$containerName" /bin/bash
  fi
}
# Create arch container or connect if exists
d_arch () {
  d_con dev_arch
}

# Create ubuntu 20.04 container or connect if exists
d_u20 () {
  d_con dev_u20
}

