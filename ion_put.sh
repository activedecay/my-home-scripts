#! /usr/bin/env bash

if [ -z $1 ]; then
    echo 'usage: ion_put <file-path> <hostname>:<remote-path>'; exit 1;
fi

filepath=$1
hostname_path=$2
hp=(${hostname_path//:/ })
hostname=${hp[0]}
remote_path=${hp[1]}
password=$(obtain_ion_password -H ${hostname})
sshpass -p "$password" scp -o UserKnownHostsFile=/dev/null \
        -o StrictHostKeyChecking=no -r ${filepath} fusionservice@${hostname}:${remote_path}
