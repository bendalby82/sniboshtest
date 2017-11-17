#!/bin/bash

timestamp(){
  date +"%Y-%m-%d %T"
}

LOGFILE=$PWD/test-routers-log.txt
LB_TEST_APP=https://statictestapp.max.pepsi.cf-app.com/
GOROUTER_IPS=(http://10.0.32.15:8080/health http://10.0.0.14:8080/health http://10.0.0.15:8080/health)
CURL_COMMAND="curl --silent --output /dev/null --write-out '%{http_code}\n' --max-time 1 "
HTTPS_CURL="$CURL_COMMAND --insecure "
POLLING_INTERVAL_IN_SECONDS=10

#Sample for an hour (6 samples a minute, 60 minutes)
for ((i=1;i<=2;i++));
do
	REPORT_LINE=$(timestamp)
	CURL_OUTPUT=`$HTTPS_CURL $LB_TEST_APP`

	if [ $? -eq 0 ]; then 
		REPORT_LINE="${REPORT_LINE} OK  "
	else
		REPORT_LINE="${REPORT_LINE} DOWN"
	fi

	for GOROUTER in ${!GOROUTER_IPS[*]}
	do
		CURL_OUTPUT=`$CURL_COMMAND ${GOROUTER_IPS[$GOROUTER]}`
		if [ $? -eq 0 ]; then 
			REPORT_LINE="${REPORT_LINE} OK  "
		else
			REPORT_LINE="${REPORT_LINE} DOWN"
		fi
	done
	echo "$REPORT_LINE"
done
