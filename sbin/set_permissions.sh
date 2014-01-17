#!/bin/bash

#
## Set the permissions on the whole installation
#

# set ownership
chown -R ${FEDORA_USER}:${FEDORA_USER} ${ISLANDORA_HOME}
chown -R ${FEDORA_USER}:${FEDORA_USER} ${FEDORA_HOME}

# set permissions
chmod -R 755 ${ISLANDORA_HOME} ${FEDORA_HOME}
