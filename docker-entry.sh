#!/bin/bash

if [[ "$#" -eq 0 ]]; then
 echo "ERROR: no altimeter URL supplied: EXITING"
 exit -1;
fi

if [[ "$#" -gt 2 ]]; then
 echo "ERROR: too many parameters supplied: EXITING"
 exit -1;
fi

cd /

sed -i -- "s|%ALTIMETER_URL%|$1|" template-config.json

if [[ "$#" -eq 2 ]]; then
 echo "INFO: using pre-provisioned credentials"
 sed -i -- "s|%ALTIMETER_PW%|$2|" template-config.json
else
 echo "INFO: unsing manual provisioning"
 sed -i -- "s|.*%ALTIMETER_PW%.*|d" template-config.json
fi

./omnicache.sh template-config.json

