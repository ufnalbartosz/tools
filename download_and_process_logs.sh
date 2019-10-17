#! /bin/sh
# @dependencies w3m

LOG_URL=$1

function get_random_name() {
    PREFIX=$1
    echo /tmp/$PREFIX-$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
}

LOG_NAME=$(get_random_name 'logs')
w3m -dump $LOG_URL > $LOG_NAME

PROCESSED_NAME=$(get_random_name 'processed')
python remove_prefix_from_log.py $LOG_NAME > $PROCESSED_NAME

echo $PROCESSED_NAME
