#!/bin/bash
# Get site name
name=$1
wp_user=$2
wp_pass=$3
wp_db=$4
wp_root_pass=$5
wps_folder="wps"

# validate argument count
if [ "$#" -ne 5 ]; then
  echo "There should be 5 arguments. Exit!"
  exit
fi

# find the current index by total number of site - use it as index
index="$(ls -l ${wps_folder} | grep -c ^d)"
folder="[${index}]_${name}"
path="${wps_folder}/${folder}/"
path_test="${wps_folder}/[${index}]*/"
if [ -d "${path_test}" ]; then
  echo "Site with index $index exists, please double check"
else
  echo "Start creating new configuration at ${path}"
  echo "== Make directories at ${path}"
  mkdir ${path}
  mkdir "${path}storage"
  mkdir "${path}db"
  # host at port on 8001, 8002, 80xx
  port=$((8000+index))
  # export variables to substitute
  export index=${index} port=${port}
  export wp_user=${wp_user} wp_pass=${wp_pass} wp_db=${wp_db} wp_root_pass=${wp_root_pass}
  # loop and export file
  for filename in site-tpl/*; do
    echo "== Parse template into file ${path}${filename}"
    cat ${filename} | envsubst > "${path}$(basename $filename)"
  done
fi
