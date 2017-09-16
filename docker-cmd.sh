#!/bin/bash

# validate arguments count
if [ "$#" -lt 2 ]; then
  echo "$# Expect at least 2 arguments. Please try './docker-cmd.sh subfolder up'"
  exit
fi

# function to execute docker command
docker_execute() {
  cmd="docker-compose -f $subfolder/docker-compose.yaml $args"
  echo "Execute cmd: ${cmd}"
  $cmd &
}

# execute command
sub=$1
args="${@:2}"

# if all, loop directories to execute
if [ "$sub" == "all" ]; then
  for subfolder in wps/*; do
    docker_execute
  done
else
  subfolder="wps/$sub"
  docker_execute
fi
