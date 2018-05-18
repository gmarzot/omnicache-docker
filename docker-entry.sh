#!/bin/bash

if [[ "$#" -eq 0 ]]; then
 echo "ERROR: no altimeter URL supplied: EXITING"
 exit -1;
fi

if [[ "$#" -gt 2 ]]; then
 echo "ERROR: too many parameters supplied: EXITING"
 exit -1;
fi

cd /opt/altimeter-omnicache
if [[ "$#" -eq 1 ]]; then
    echo "connecting to Altimeter for manual registration: $1"
    printf "$1\n2\n" | ./omnicache.sh
elif [[ "$#" -eq 2 ]]; then
    echo "connecting to Altimeter for auto registration: $1 $2"
    sed -i -- "s|%ALTIMETER_PW%|$2|" provisioned-config.json
    sed -i -- "s|%ALTIMETER_URL%|$1|" provisioned-config.json
    ./omnicache.sh provisioned-config.json
fi

