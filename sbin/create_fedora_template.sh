#!/bin/bash -x 
# Islandora Software Installation Framework (ISIF)
# by Steve Young (SLY), Hamilton College 2014
#
# is licensed under a Creative Commons Attribution 4.0 International License.
# http://creativecommons.org/licenses/by/4.0/deed.en_US
# Based on a work at http://github.com/hamhpc/islandora.git.
# Permissions beyond the scope of this license may be available at http://www.hamilton.edu.

#
# Revisions
#
# 2/5/2014 - SLY - Initial Creation


rsync -ar ${FEDORA_HOME} ${HOME}/fedora_template

rm -rf ${HOME}/fedora_template/fedora/server/logs/*
rm -rf ${HOME}/fedora_template/fedora/tomcat/logs/*

for CONFIG_FILE in `find $HOME/fedora_template -type f -exec egrep -f ${HOME}/etc/variables_to_remove.txt {} -ls \;`
do
	for VARIABLE in `cat ${HOME}/etc/variables_to_remove.txt`
	do
		# change the Variables
		VALUE=`grep $VARIABLE ${HOME}/etc/variables_to_update.txt |awk '{print $1}'`
		VAR_SET=`grep $VARIABLE ${HOME}/etc/variables_to_update.txt |awk '{print $2}'`
		echo "Changing $VALUE to $VAR_SET in ... $CONFIG_FILE"
		sed -i s/$VARIABLE/$VAR_SET/g $CONFIG_FILE
		echo "sed -i s/${VALUE}/$VAR_SET/g $CONFIG_FILE"
		echo " Done."
		echo ""
		echo ""
	done

done

echo "Now copy $HOME/fedora_template/fedora to /root/cpanel3-skel/ as root"
