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



. ${HOME}/islandora/etc/database.properties.sh
ETC_DIR=${HOME}/etc/SQL

#
# Dump current production sites for import
#
# Dump production drupal database from MySQL
echo "Dumping contents of Production Drupal $PROD_DB_DRU database......"
echo "mysqldump -h ${DB_SERVER} -u ${DRUPAL_DB_USER} -p${DRUPAL_DB_PASS} ${DRUPAL_DB_NAME} > ${ETC_DIR}/${DRUPAL_DB_NAME}.sql"
mysqldump -h ${DB_SERVER} -u ${DRUPAL_DB_USER} -p${DRUPAL_DB_PASS} ${DRUPAL_DB_NAME} > ${ETC_DIR}/${DRUPAL_DB_NAME}.sql
echo " Done."
echo ""
echo ""

# Dump production fedora database from MySQL
echo "Dumping contents of Production Fedora Commons $PROD_DB_FED database......"
echo "mysqldump -h ${DB_SERVER} -u ${FEDORA_DB_USER} -p${FEDORA_DB_PASS} ${FEDORA_DB_NAME} > ${ETC_DIR}/${FEDORA_DB_NAME}.sql"
mysqldump -h ${DB_SERVER} -u ${FEDORA_DB_USER} -p${FEDORA_DB_PASS} ${FEDORA_DB_NAME} > ${ETC_DIR}/${FEDORA_DB_NAME}.sql
echo " Done."
echo ""
echo ""


#
# Massage the SQL data (via sed) to change configuration values
# (ie. name of web server)
#

for CONFIG_FILE in ${ETC_DIR}/${DRUPAL_DB_NAME}.sql ${ETC_DIR}/${FEDORA_DB_NAME}.sql
do
        for VARIABLE in `cat ${HOME}/etc/variables_to_create.txt`
        do
                # change the Variables
                VALUE=`grep $VARIABLE ${HOME}/etc/variables_to_update.txt |awk '{print $1}'`
                echo "Changing $VALUE to $VARIABLE in ... $CONFIG_FILE"
                echo "sed -i s/$VARIABLE/$VALUE/g $CONFIG_FILE"
                sed -i s/$VARIABLE/$VALUE/g $CONFIG_FILE
                echo " Done."
                echo ""
                echo ""

        done

done

mv ${ETC_DIR}/${DRUPAL_DB_NAME}.sql ${ETC_DIR}/template_drupal.sql
mv ${ETC_DIR}/${FEDORA_DB_NAME}.sql ${ETC_DIR}/template_fedora.sql

echo " Done."
echo ""
echo ""
