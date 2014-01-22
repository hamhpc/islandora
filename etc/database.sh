#---------------------------------------------
#
# Database info
#
#---------------------------------------------
#
export DB_SERVER=DATABASE_SERVER_TO_CHANGE			# hostname of the MySQL server
export SERVER_NAME=SERVER_NAME_TO_CHANGE        # short hostname of this server 
export FULL_SERVER_NAME=FULL_SERVER_NAME_TO_CHANGE  # full hostname of the server for the base apache server

#---------------------------------------------
#
# Drupal database info
#
#---------------------------------------------
#
export DRUPAL_ROOT=DRUPAL_ROOT_TO_CHANGE		# Top level of the drupal web root
export DRUPAL_DB_NAME="DRUPAL_DB_NAME_TO_CHANGE"          	# Drupal database name
export DRUPAL_DB_USER="DRUPAL_DB_USER_TO_CHANGE"          	# Drupal username for settings.php file
export DRUPAL_DB_PASS="DRUPAL_DB_PASS_TO_CHANGE"           	# Drupal password for settings.php file
export DRUPAL_ADMIN_USER="DRUPAL_ADMIN_USER_TO_CHANGE"       # Drupal admin username to log into Drupal Site
export DRUPAL_ADMIN_PASS="DRUPAL_ADMIN_PASS_TO_CHANGE"       		# Drupal admin password to log into Drupal Site
export DRUPAL_SITE_NAME="DRUPAL_SITE_NAME_TO_CHANGE"     # Drupal site name - displayed on the web site
export DRUPAL_DB_PREFIX="DRUPAL_DB_PREFIX_TO_CHANGE"			# Drupal database prefix

#---------------------------------------------
#
# Fedora database info
#
#---------------------------------------------
#
export FEDORA_DB_NAME="FEDORA_DB_NAME_TO_CHANGE"        		# Name of fedora MySQL database -> fedora3 is recommeneded
export FEDORA_DB_USER="FEDORA_DB_USER_TO_CHANGE"        		# Fedora db username -> for fedora.fcfg file
export FEDORA_DB_PASS="FEDORA_DB_PASS_TO_CHANGE"         	# Fedora db password -> for fedora.fcfg file
export FEDORA_ADMIN_USER="FEDORA_ADMIN_USER_TO_CHANGE"          # Username for http://localhost:8080/fedora/admin
export FEDORA_ADMIN_PASS="FEDORA_ADMIN_PASS_TO_CHANGE"          	# Password for http://localhost:8080/fedora/admin
