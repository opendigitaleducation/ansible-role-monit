#!/bin/bash

HOSTNAME=`hostname`

MONGO_STATUS[0]="STARTUP"
MONGO_STATUS[1]="PRIMARY"
MONGO_STATUS[2]="SECONDARY"
MONGO_STATUS[3]="RECOVERING"
MONGO_STATUS[5]="STARTUP2"
MONGO_STATUS[6]="UNKNOWN"
MONGO_STATUS[7]="ARBITER"
MONGO_STATUS[8]="DOWN"
MONGO_STATUS[9]="ROLLBACK"
MONGO_STATUS[10]="REMOVED"

MY_STATE=`mongo --eval "printjson(rs.status().myState)" --quiet`

if [ ${MY_STATE} -ne 2 ] && [ ${MY_STATE} -ne 1 ] && [ ${MY_STATE} -ne 7 ] ; then
        echo "${MONGO_STATUS[${MY_STATE}]}" >&2
        exit 1
fi
