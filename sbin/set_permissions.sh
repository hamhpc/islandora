#
# Script to set permissions
#
# 1/9/2014 SLY

#
#
#
# Source environment
. ../etc/env.sh
. ../etc/database.sh


#
## Set the permissions on the whole installation
#

# set ownership
chown -R ${FEDORA_USER}:${FEDORA_USER} ${ISLANDORA_HOME}
chown -R ${FEDORA_USER}:${FEDORA_USER} ${FEDORA_HOME}
chown -R ${FEDORA_USER}:${FEDORA_USER} ${DRUPAL_ROOT}

# set permissions
chmod -R 755 ${ISLANDORA_HOME} ${FEDORA_HOME}
chmod -R 640 ${ISLANDORA_HOME}/etc ${FEDORA_HOME}
