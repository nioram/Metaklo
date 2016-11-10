#!/bin/bash
##following bad code is written by nioram
installdir="/home/pi/2/"
gpiopin="25"
htmldir="/var/www/html/"

cd $installdir

while :
do

date=$(date)
closedhtmlfile="${htmldir}closed.html"
openhtmlfile="${htmldir}open.html"
indexhtmlfile="${htmldir}index.html"
statusjsonfile="${htmldir}status.json"
logfile="/home/pi/shitdata.txt"
closedtwittermessage="Gschissen! Des heisl is zua. @${date}"
opentwittermessage="Geh scheissen, Oida! Des heisl is offen! @${date}"

state=$(gpio -g read $gpiopin)
sleep 1

	if [[ $state !=  $oldstate ]];
	then

			if [ $state = 1 ]
			then

cp  $closedhtmlfile $indexhtmlfile && cp $closedhtmlfile  $statusjsonfile

echo $date closed >> $logfile

php send.php "$closedtwittermessage"

sleep 1

			else

cp $openhtmlfile $indexhtmlfile  && cp $openhtmlfile $statusjsonfile

echo $date open >> $logfile

php send.php "$opentwittermessage"

sleep 1

		fi
	fi
oldstate=$state

done
