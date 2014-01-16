#---------------------------------------------
#
# Environment variables 
#
#---------------------------------------------
#
export FEDORA_HOME=FEDORA_HOME_TO_CHANGE
export FEDORA_USER=FEDORA_USER_TO_CHANGE
export ISLANDORA_HOME=ISLANDORA_HOME_TO_CHANGE
export ISLANDORA_PKGS=$ISLANDORA_HOME/packages
export SRC_DIR=$ISLANDORA_HOME/src
export CATALINA_HOME=$FEDORA_HOME/tomcat
export SOLR_HOME=SOLR_HOME_TO_CHANGE
export FEDORA_START=$CATALINA_HOME/bin/startup.sh
export FEDORA_STOP=$CATALINA_HOME/bin/shutdown.sh
#---------------------------------------------
#
# JAVA environment variables 
#
#---------------------------------------------
#
export JAVA_HOME=JAVA_HOME_TO_CHANGE
export JRE_HOME=$JAVA_HOME/jre
export JAVA_OPTS="-Xms1024m -Xmx1024m -XX:MaxPermSize=1200m -Djavax.net.ssl.trustStore=$FEDORA_HOME/server/truststore -Djavax.net.ssl.trustStorePassword=tomcat"
#---------------------------------------------
#
# User environment variables 
#
#---------------------------------------------
#
export PATH=$ISLANDORA_HOME/bin:${ISLANDORA_HOME}/sbin:${HOME}/bin:${JAVA_HOME}/bin:${PATH}
export LD_LIBRARY_PATH=$ISLANDORA_HOME/lib:$CATALINA_HOME/lib:${HOME}/lib:${LD_LIBRARY_PATH}
export LOGPATH=${CATALINA_HOME}/logs
