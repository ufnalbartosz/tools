#!/bin/bash
URL_OK=$1
URL_BAD=$2

LOG_OK=$(bash download_and_process_logs.sh $URL_OK)
LOG_BAD=$(bash download_and_process_logs.sh $URL_BAD)

git diff --no-index $LOG_OK $LOG_BAD
