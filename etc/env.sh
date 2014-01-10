## Variables
export FEDORA_HOME=/opt/fedora
export FEDORA_USER=fedora
export ISLANDORA_HOME=/opt/islandora
export ISLANDORA_PKGS=$ISLANDORA_HOME/packages
export CATALINA_HOME=$FEDORA_HOME/tomcat
export SOLR_HOME=/opt/solr
#
# Java variables
#
export JAVA_HOME=/usr/lib/jvm/java-1.6.0-openjdk-1.6.0.0.x86_64
export JRE_HOME=$JAVA_HOME/jre
export JAVA_OPTS="-Xms1024m -Xmx1024m -XX:MaxPermSize=1200m -Djavax.net.ssl.trustStore=$FEDORA_HOME/server/truststore -Djavax.net.ssl.trustStorePassword=tomcat"
#
export FEDORA_START=$CATALINA_HOME/bin/startup.sh
export FEDORA_STOP=$CATALINA_HOME/bin/shutdown.sh
export PATH=$ISLANDORA_HOME/bin:${HOME}/bin:${JAVA_HOME}/bin:${PATH}
export LD_LIBRARY_PATH=$ISLANDORA_HOME/lib:$CATALINA_HOME/lib:${HOME}/lib:${LD_LIBRARY_PATH}
export LOGPATH=${CATALINA_HOME}/logs
