#!/bin/bash
# Run with:
# nohup ./test-lb.sh &
# Kill with:
# kill %1 #where 1 is job number

timestamp(){
  date +"%Y-%m-%d %T"
}

LOGFILE=$PWD/test-lb-verbose-log.txt
LB_TEST_APP=https://statictestapp.max.pepsi.cf-app.com/

for ((i=1;i<=100000;i++));
do
	REPORT_LINE=$(timestamp)
	REPORT_LINE="${REPORT_LINE} ******************************************************************"
	echo "$REPORT_LINE" >> $LOGFILE

	curl --silent --verbose --max-time 5 --insecure $LB_TEST_APP >>$LOGFILE 2>&1

	if [ ! $? -eq 0 ]; then 
		echo "****ERROR****" >> $LOGFILE
	fi

done
