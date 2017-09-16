#!/bin/bash
args="$*"
# loop directories to get config
cmd="docker-compose -f docker-compose.yaml"
for d in ./wp_configs/*/ ; do
    cmd="${cmd} -f ${d}config.yaml"
done
cmd="${cmd} ${args}"
echo "cmd: ${cmd}"
$cmd
