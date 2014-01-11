#!/bin/bash

. ${HOME}/islandora/etc/database.properties.sh
ETC_DIR=${HOME}/etc/SQL

#
# Create clean databases
# 
# Drupal DB (Install from cpanel first)
#
# Fedora Commons DB
# create in phpmyadmin
#echo -n "Create clean database for ${FEDORA_DB_NAME}..... "
#mysqladmin -h ${DB_SERVER} -u ${FEDORA_DB_USER} -p${FEDORA_DB_PASS} create ${FEDORA_DB_NAME}
#echo "mysqladmin -h ${DB_SERVER} -u ${FEDORA_DB_USER} -p${FEDORA_DB_PASS} create ${FEDORA_DB_NAME}"
#echo " Done."
#echo ""
#echo ""
 

#
# Massage the SQL data (via sed) to change configuration values
# (ie. name of web server)
#
# make a copy to use to massage data for importing.
cp -f ${ETC_DIR}/template_drupal.sql ${ETC_DIR}/${DRUPAL_DB_NAME}.${SERVER_NAME}.sql
cp -f ${ETC_DIR}/template_fedora.sql ${ETC_DIR}/${FEDORA_DB_NAME}.${SERVER_NAME}.sql


for CONFIG_FILE in ${ETC_DIR}/${DRUPAL_DB_NAME}.${SERVER_NAME}.sql ${ETC_DIR}/${FEDORA_DB_NAME}.${SERVER_NAME}.sql
do
        for VARIABLE in `cat ${HOME}/etc/variables_to_create.txt`
        do
                # change the Variables
                VALUE=`grep $VARIABLE ${HOME}/etc/variables_to_update.txt |awk '{print $1}'`
                echo "Changing $VARIABLE to $VALUE in ... $CONFIG_FILE"
                sed -i s/$VALUE/$VARIABLE/g $CONFIG_FILE
                echo "sed -i s/$VALUE/$VARIABLE/g $CONFIG_FILE"
                echo " Done."
                echo ""
                echo ""

        done

done

# 
# Import databases
#
echo -n "Import drupal database ${ETC_DIR}/${DRUPAL_DB_NAME}.${SERVER_NAME}.sql into ${DRUPAL_DB_NAME}..... "
mysql -h ${DB_SERVER} -u ${DRUPAL_DB_USER} -p${DRUPAL_DB_PASS} ${DRUPAL_DB_NAME} < ${ETC_DIR}/${DRUPAL_DB_NAME}.${SERVER_NAME}.sql
echo " Done."
echo ""
echo ""

echo -n "Import fedora commons database ${ETC_DIR}/${FEDORA_DB_NAME}.${SERVER_NAME}.sql into ${FEDORA_DB_NAME}..... "
mysql -h ${DB_SERVER} -u ${FEDORA_DB_USER} -p${FEDORA_DB_PASS} ${FEDORA_DB_NAME} < ${ETC_DIR}/${FEDORA_DB_NAME}.${SERVER_NAME}.sql
echo " Done."
echo ""
echo ""
