#!/bin/bash

#-------------------------------
#
# This script will find all the files in the fedora tree
# and set the variables to use in the environment
#
#-------------------------------

. ../etc/env.sh
. ../etc/database.sh

for CONFIG_FILE in `find $FEDORA_HOME -type f -exec egrep -f ${ISLANDORA_HOME}/etc/variables_to_create.txt {} -ls \;`
do
	for VARIABLE in `cat ${ISLANDORA_HOME}/etc/variables_to_create.txt`
	do
		# change the Variables
		VALUE=`grep $VARIABLE $ISLANDORA_HOME/etc/variables_to_update.txt |awk '{print $1}'`
		echo "Changing $VARIABLE to $VALUE in ... $CONFIG_FILE"
		sed -i s/$VARIABLE/$VALUE/g $CONFIG_FILE
		echo "sed -i s/$VARIABLE/$VALUE/g $CONFIG_FILE"
		echo " Done."
		echo ""
		echo ""


	done

done
