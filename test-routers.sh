#!/bin/bash

timestamp(){
  date +"%Y-%m-%d %T"
}

LOGFILE=$PWD/test-routers-log.txt
LB_TEST_APP=https://
GOROUTER_IPS=(127.0.0.1 127.0.0.2 127.0.0.3)
CURL_COMMAND=


for ((i=1;i<=5;i++));
do

	for GOROUTER in ${!GOROUTER_IPS[*]}
	do
		echo $GOROUTER ${GOROUTER_IPS[$GOROUTER]}
	done

done
