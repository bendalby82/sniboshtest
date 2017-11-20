#!/bin/bash
# Run with:
# nohup ./test-lb.sh &
# Kill with:
# kill %1 #where 1 is job number

timestamp(){
  date +"%Y-%m-%d %T"
}

LOGFILE=$PWD/test-lb-log.txt
LB_TEST_APP=https://statictestapp.max.pepsi.cf-app.com/
CURL_COMMAND="curl --silent --output /dev/null --write-out '%{http_code}\n' --max-time 1 "
HTTPS_CURL="$CURL_COMMAND --insecure "

for ((i=1;i<=100000;i++));
do
	REPORT_LINE=$(timestamp)
	CURL_OUTPUT=`$HTTPS_CURL $LB_TEST_APP`

	if [ $? -eq 0 ]; then 
		REPORT_LINE="${REPORT_LINE} OK  "
	else
		REPORT_LINE="${REPORT_LINE} DOWN"
	fi

	echo "$REPORT_LINE" >> $LOGFILE

done
