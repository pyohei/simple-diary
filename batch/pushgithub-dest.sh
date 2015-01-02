#!/bin/sh

LOG_DIR=
FILE_PATH=
UPDATE_DAY=`stat -c %y ${FILE_PATH} |date -f - +%Y%m%d%H%M%S`
YESTERDAY=`date -d '-1 days' +%Y%m%d000000`

echo [`date +'%Y%m%d%H%M%S'`] start 1>>$LOG_DIR 2>&1

if [ ${UPDATE_DAY} -ge ${YESTERDAY} ]
then
    git add ${FILE_PATH}
    COMMIT_DAY=`date -d '-1 days' +%Y%m%d000000`
    git commit -m "submit comment in ${COMMIT_DAY}"
    git push
    echo [`date +'%Y%m%d%H%M%S'`] push 1>>$LOG_DIR 2>&1
fi

echo [`date +'%Y%m%d%H%M%S'`] end 1>>$LOG_DIR 2>&1
