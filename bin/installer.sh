#!/bin/bash

#
# Script to automatically install Drupal, Fedora Commons, and Islandora Modules
#
# 1/9/2014 SLY

# Assumptions:
#
#  - Databases are created in MySQL and you have DB names, users, and passwords for them. 
#     ( one for Fedora Commons and one for Drupal )

#%post
# Uncomment the above and put this at the end of a kickstart file. Also remove /bin/bash line at the top. 
# This was tested with a Basic Server installation in kickstart
#
# Update OS
#
yum -y update
#
# Install any other packages on the OS if needed
#
# yum -y install <package_name>-<package-version>
#
yum -y install gcc
yum -y install gcc-c++
yum -y install autoconf
yum -y install java-1.6.0-openjdk.x86_64
yum -y install ImageMagick
yum -y install ghostscript
yum -y install ant
yum -y install git
#
# Enable EPEL
#
rpm -ivh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
#
# Enable RPM Fusion Repo
rpm -ivh http://download1.rpmfusion.org/free/el/updates/6/i386/rpmfusion-free-release-6-1.noarch.rpm
#
# Get RPM Fusion softwares
#
yum -y install ffmpeg
yum -y install xpdf
#
# ffmpeg2theora
#
wget http://v2v.cc/~j/ffmpeg2theora/ffmpeg2theora-0.29.linux64.bin
install -m 755 ffmpeg2theora-0.29.linux64.bin /usr/bin/ffmpeg2theora
#
# End of Operating System Setup
################################

# 
# Get the hamhpc/islandora Git Repo
#
cd /opt
git clone git://github.com/hamhpc/islandora.git

#
# Variables
#
HostName=`hostname` 
#
# Set up application installation variables
#
## Variables
SERVER_NAME=collections
INSTALL_PREFIX=/opt
WEB_ROOT=/var/www/html
IP_ADDR="150.209.9.118"
SRC_DIR=$ISLANDORA_HOME/src
SITES_ALL_MODULES=$WEB_ROOT/sites/all/modules
SITES_ALL_LIB=$WEB_ROOT/sites/all/libraries
#
# env.sh variables
#
FEDORA_HOME=$INSTALL_PREFIX/fedora
FEDORA_USER=fedora
ISLANDORA_HOME=$INSTALL_PREFIX/islandora
ISLANDORA_PKGS=$ISLANDORA_HOME/packages
CATALINA_HOME=$FEDORA_HOME/tomcat
SOLR_HOME=$INSTALL_PREFIX/solr
#
# Java variables
#
JAVA_HOME=/usr/lib/jvm/java-1.6.0-openjdk-1.6.0.0.x86_64
JRE_HOME=$JAVA_HOME/jre
JAVA_OPTS="-Xms1024m -Xmx1024m -XX:MaxPermSize=1200m -Djavax.net.ssl.trustStore=$FEDORA_HOME/server/truststore -Djavax.net.ssl.trustStorePassword=tomcat"
#
FEDORA_START=$CATALINA_HOME/bin/startup.sh
FEDORA_STOP=$CATALINA_HOME/bin/shutdown.sh
PATH=${HOME}/islandora/bin:${HOME}/bin:${PATH}:${JAVA_HOME}/bin
LD_LIBRARY_PATH=${HOME}/islandora/lib:${HOME}/fedora/tomcat/lib:${HOME}/lib:${LD_LIBRARY_PATH}
LOGPATH=${CATALINA_HOME}/logs
#
# database.sh
#
DRUPAL_ROOT=$WEB_ROOT/collections
DRUPAL_DB_NAME="${USER}_drup2"          # Drupal database name
DRUPAL_DB_USER="${USER}_drup2"          # Drupal username for settings.php file
DRUPAL_DB_PASS="X[k[5zg)l3@~0"           # Drupal password for settings.php file
DRUPAL_ADMIN_USER="IslandoraAdmin"       # Drupal admin username to log into Drupal Site
DRUPAL_ADMIN_PASS="Islandora@dm1n"       # Drupal admin password to log into Drupal Site
DRUPAL_SITE_NAME="Islandora Sandbox"     # Drupal site name - displayed on the web site
FEDORA_DB_NAME="${USER}_fedora3"        # Name of fedora MySQL database -> fedora3 is recommeneded
FEDORA_DB_USER="${USER}_fedora3"        # Fedora db username -> for fedora.fcfg file
FEDORA_DB_PASS="Island0r@F3d0r@"         # Fedora db password -> for fedora.fcfg file
FEDORA_ADMIN_USER="fedoraAdmin"          # Username for http://localhost:8080/fedora/admin
FEDORA_ADMIN_PASS="F3d0r@Adm1n"          # Password for http://localhost:8080/fedora/admin
DB_SERVER=localhost

#
## create islandora directory tree
#
# (should grab a git repo for this)
#
mkdir -p $ISLANDORA_HOME
mkdir -p $ISLANDORA_PKGS
mkdir -p $ISLANDORA_HOME/etc
mkdir -p $ISLANDORA_HOME/bin
mkdir -p $ISLANDORA_HOME/lib
mkdir -p $ISLANDORA_HOME/man
mkdir -p $ISLANDORA_HOME/share
mkdir -p $ISLANDORA_HOME/src
mkdir -p $ISLANDORA_HOME/include

#
# create etc settings files env.sh
#

cd $SRC_DIR
#
# Dependancy software 
#
## LAME installation
#
wget -P $SRC_DIR http://sourceforge.net/projects/lame/files/lame/3.99/lame-3.99.5.tar.gz/download
tar -zxvf lame-3.99.5.tar.gz
cd lame-3.99.5
./configure --prefix=$ISLANDORA_PKGS
make
make install
cd $ISLANDORA_PKGS/lame-3.99.5
cp $ISLANDORA_PKGS/Makefile .
# modify makefile for directories
make install 
# above gets symlinked into $ISLANDORA_HOME/bin
#
## Leptonica installation
#
wget -P $SRC_DIR http://www.leptonica.org/source/leptonica-1.69.tar.gz
cd $SRC_DIR
tar -zxvf leptonica-1.69.tar.gz
cd leptonica-1.69
./configure --prefix=$ISLANDORA_PKGS/leptonica-1.69
make
make install
cd $ISLANDORA_PKGS/leptonica-1.69 
cp ../Makefile .
# edit Makefile
make install
# above gets symlinked into $ISLANDORA_HOME/bin
#
## tesseract install
#
cd $SRC_DIR
wget https://tesseract-ocr.googlecode.com/files/tesseract-ocr-3.02.02.tar.gz
tar -zxvf tesseract-ocr-3.02.02.tar.gz
cd tesseract-ocr
./configure --prefix=$ISLANDORA_PKGS/tesseract-3.02.02
make 
make install
cd $ISLANDORA_PKGS/tesseract-3.02.02
cp ../Makefile .
# edit Makefile
make install
# above gets symlinked into $ISLANDORA_HOME/bin
#


#
# Install Drupal
#
wget -P $SRC_DIR http://ftp.drupal.org/files/projects/drupal-7.25.tar.gz
tar -zxvf -C $WEB_ROOT $SRC_DIR/drupal-7.25.tar.gz 
mv $WEB_ROOT/drupal-7.25 $DRUPAL_ROOT
#
# Install Fedora Commons
#
## get software
wget http://downloads.sourceforge.net/fedora-commons/fcrepo-installer-3.5.jar
#
## create install.properties
echo "#Install Options" > install.properties
echo -n "#";date >> install.properties
echo "keystore.file=included" >> install.properties
echo "ri.enabled=true" >> install.properties
echo "messaging.enabled=true" >> install.properties
echo "apia.auth.required=false" >> install.properties
echo "database.jdbcDriverClass=com.mysql.jdbc.Driver" >> install.properties
echo "tomcat.ssl.port=8443" >> install.properties
echo "ssl.available=true" >> install.properties
echo "database.jdbcURL=jdbc\:mysql\://$DB_SERVER/$FEDORA_DB_NAME?useUnicode\=true&amp;characterEncoding\=UTF-8&amp;autoReconnect\=true" >> install.properties
echo "messaging.uri=vm\:(broker\:(tcp\://localhost\:61616))" >> install.properties
echo "database.password=$FEDORA_DB_PASS" >> install.properties
echo "database.mysql.driver=included" >> install.properties
echo "database.username=$FEDORA_DB_USER" >> install.properties
echo "fesl.authz.enabled=false" >> install.properties
echo "tomcat.shutdown.port=8005" >> install.properties
echo "deploy.local.services=true" >> install.properties
echo "xacml.enabled=true" >> install.properties
echo "database.mysql.jdbcDriverClass=com.mysql." >> install.propertiesjdbc.Driver
echo "tomcat.http.port=8080" >> install.properties
echo "fedora.serverHost=localhost" >> install.properties
echo "database=mysql" >> install.properties
echo "database.driver=included" >> install.properties
echo "fedora.serverContext=fedora" >> install.properties
echo "llstore.type=akubra-fs" >> install.properties
echo "tomcat.home=$CATALINA_HOME" >> install.properties
echo "fesl.authn.enabled=true" >> install.properties
echo "database.mysql.jdbcURL=jdbc\:mysql\://$DB_HOST/$FEDORA_DB_NAME?useUnicode\=true&amp;characterEncoding\=UTF-8&amp;autoReconnect\=true" >> install.properties
echo "fedora.home=$FEDORA_HOME" >> install.properties
echo "install.type=custom" >> install.properties
echo "servlet.engine=included" >> install.properties
echo "apim.ssl.required=false" >> install.properties
echo "fedora.admin.pass=$FEDORA_ADMIN_PASS" >> install.properties
echo "apia.ssl.required=false" >> install.properties
echo "" >> install.properties
#
## Fresh fedora commons install
#
/usr/bin/java -jar fcrepo-installer-3.5.jar install.properties

# 
# Start Fedora to get things populated
#
$CATALINA_HOME/bin/startup.sh
sleep 30
#
# Now stop fedora
#
pkill java
#
# Change XACML policies
#
rm ${FEDORA_HOME}/data/fedora-xacml-policies/repository-policies/default/deny-purge-* 
mkdir ${FEDORA_HOME}/data/fedora-xacml-policies/repository-policies/islandora

#
# Copy islandora policies
#
cp $WEB_ROOT/sites/all/modules/islandora-7.x-1.2/policies/permit-* ${FEDORA_HOME}/data/fedora-xacml-policies/repository-policies/islandora

#
# update policy manually
# 
echo "Please make sure to update $FEDORA_HOME/data/fedora-xacml-policies/repository-policies/default/deny-apim-if-not-localhost.xml"
echo "Add <AttributeValue DataType="http://www.w3.org/2001/XMLSchema#string">$IP_ADDR</AttributeValue> after the 127.0.0.1 line"

#
# install fedora gsearch
#
wget -P $SRC_DIR  http://downloads.sourceforge.net/fedora-commons/fedoragsearch-2.4.2.zip
unzip fedoragsearch-2.4.2.zip
cp fedoragsearch-2.4.2/fedoragsearch.war ${FEDORA_HOME}/tomcat/webapps/

#
# install Solr
#
wget -P $SRC_DIR http://archive.apache.org/dist/lucene/solr/3.6.2/apache-solr-3.6.2.tgz
tar -zxvf apache-solr-3.6.2.tgz
cp apache-solr-3.6.2/example/webapps/solr.war ${FEDORA_HOME}/tomcat/webapps
cp -r apache-solr-3.6.2/example/solr $SOLR_HOME
# wget solr-web.xml or modify it
mv ${FEDORA_HOME}/tomcat/webapps/solr/WEB-INF/web.xml ${FEDORA_HOME}/tomcat/webapps/solr/WEB-INF/web.xml-orig
cp solr-web.xml ${FEDORA_HOME}/tomcat/webapps/solr/WEB-INF
#
# setup solr schema
#
mv $SOLR_HOME/conf/schema.xml $SOLR_HOME/conf/schema.bak
cp ${FEDORA_HOME}/tomcat/webapps/fedoragsearch/WEB-INF/classes/fgsconfigFinal/index/FgsIndex/conf/schema-3.6.0-for-fgs-2.4.2.xml $SOLR_HOME/conf/schema.xml

#
# Install Gsearch user
#
# wget fedora-users.xml or modify it
mv ${FEDORA_HOME}/server/config/fedora-users.xml ${FEDORA_HOME}/server/config/fedora-users.xml-orig
cp $SRC_DIR/fedora-users.xml ${FEDORA_HOME}/server/config/

#
# set up Gsearch
#
# wget fgsconfig-basic.properties or modify it
cp $SRC_DIR/fgsconfig-basic.properties $FEDORA_HOME/tomcat/webapps/fedoragsearch/FgsConfig/
#
# build config
#
cd $FEDORA_HOME/tomcat/webapps/fedoragsearch/FgsConfig/
ant -f fgsconfig-basic.xml
cd $SRC_DIR

#
## Adore Djatoka install
#
cd $SRC_DIR
wget http://sourceforge.net/projects/djatoka/files/latest/download?source=files
tar -zxvf -C $ISLANDORA_PKGS adore-djatoka-1.1.tar.gz
cp $ISLANDORA_PKGS/adore-djatoka-1.1/dist/adore-djatoka.war $CATALINA_HOME/webapps/
# wait for tomcat to pick up the new app
sleep 30 
cp $ISLANDORA_PKGS/adore-djatoka-1.1/dist/adore-djatoka-1.1.jar ${FEDORA_HOME}/tomcat/webapps/adore-djatoka/WEB-INF/lib/
#
# link Djatoka binaries to /usr/bin
# needed to do this in order to enable the module for Large Image Collection.
# Then I in the module for the path I could change it to /opt/islandora/bin/kdu_compress
#
ln -s $ISLANDORA_PKGS/adore-djatoka-1.1/bin/Linux-x86-64/kdu_compress /usr/bin/kdu_compress
ln -s $ISLANDORA_PKGS/adore-djatoka-1.1/bin/Linux-x86-64/kdu_expand /usr/bin/kdu_expand


#
# Install islandora drupal modules
#
wget -P $SRC_DIR http://islandora.ca/sites/default/files/7.x-1.2/islandora-7.x-1.2.zip
unzip $SRC_DIR/islandora-7.x-1.2.zip -d $SITES_ALL_MODULES
wget -P $SRC_DIR http://islandora.ca/sites/default/files/7.x-1.2/islandora_solution_pack_audio-7.x-1.2.zip
unzip $SRC_DIR/islandora_solution_pack_audio-7.x-1.2.zip -d $SITES_ALL_MODULES
wget -P $SRC_DIR http://islandora.ca/sites/default/files/7.x-1.2/islandora_solution_pack_image-7.x-1.2.zip
unzip $SRC_DIR/islandora_solution_pack_image-7.x-1.2.zip -d $SITES_ALL_MODULES
wget -P $SRC_DIR http://islandora.ca/sites/default/files/7.x-1.2/islandora_solution_pack_book-7.x-1.2.zip
unzip $SRC_DIR/islandora_solution_pack_book-7.x-1.2.zip -d $SITES_ALL_MODULES
wget -P $SRC_DIR http://islandora.ca/sites/default/files/7.x-1.2/islandora_solution_pack_compound-7.x-1.2.zip
unzip $SRC_DIR/islandora_solution_pack_compound-7.x-1.2.zip -d $SITES_ALL_MODULES
wget -P $SRC_DIR http://islandora.ca/sites/default/files/7.x-1.2/islandora_solution_pack_collection-7.x-1.2.zip
unzip $SRC_DIR/islandora_solution_pack_collection-7.x-1.2.zip -d $SITES_ALL_MODULES
wget -P $SRC_DIR http://islandora.ca/sites/default/files/7.x-1.2/islandora_solution_pack_large_image-7.x-1.2.zip
unzip $SRC_DIR/islandora_solution_pack_large_image-7.x-1.2.zip -d $SITES_ALL_MODULES
wget -P $SRC_DIR http://islandora.ca/sites/default/files/7.x-1.2/islandora_solution_pack_newspaper-7.x-1.2.zip
unzip $SRC_DIR/islandora_solution_pack_newspaper-7.x-1.2.zip -d $SITES_ALL_MODULES
wget -P $SRC_DIR http://islandora.ca/sites/default/files/7.x-1.2/islandora_solution_pack_pdf-7.x-1.2.zip
unzip $SRC_DIR/islandora_solution_pack_pdf-7.x-1.2.zip -d $SITES_ALL_MODULES
wget -P $SRC_DIR http://islandora.ca/sites/default/files/7.x-1.2/islandora_solution_pack_video-7.x-1.2.zip
unzip $SRC_DIR/islandora_solution_pack_video-7.x-1.2.zip -d $SITES_ALL_MODULES
wget -P $SRC_DIR http://islandora.ca/sites/default/files/7.x-1.2/islandora_paged_content-7.x-1.2.zip
unzip $SRC_DIR/islandora_paged_content-7.x-1.2.zip -d $SITES_ALL_MODULES
wget -P $SRC_DIR http://islandora.ca/sites/default/files/7.x-1.2/islandora_jwplayer-7.x-1.2.zip
unzip $SRC_DIR/islandora_jwplayer-7.x-1.2.zip -d $SITES_ALL_MODULES
wget -P $SRC_DIR http://islandora.ca/sites/default/files/7.x-1.2/objective_forms-7.x-1.2.zip
unzip $SRC_DIR/objective_forms-7.x-1.2.zip -d $SITES_ALL_MODULES
wget -P $SRC_DIR http://islandora.ca/sites/default/files/7.x-1.2/php_lib-7.x-1.2.zip
unzip $SRC_DIR/php_lib-7.x-1.2.zip -d $SITES_ALL_MODULES
wget -P $SRC_DIR http://islandora.ca/sites/default/files/7.x-1.2/islandora_xml_forms-7.x-1.2.zip
unzip $SRC_DIR/islandora_xml_forms-7.x-1.2.zip -d $SITES_ALL_MODULES
wget -P $SRC_DIR http://islandora.ca/sites/default/files/7.x-1.2/islandora_fits-7.x-1.2.zip
unzip $SRC_DIR/islandora_fits-7.x-1.2.zip -d $SITES_ALL_MODULES
wget -P $SRC_DIR http://islandora.ca/sites/default/files/7.x-1.2/islandora_ip_embargo-7.x-1.2.zip
unzip $SRC_DIR/islandora_ip_embargo-7.x-1.2.zip -d $SITES_ALL_MODULES
wget -P $SRC_DIR http://islandora.ca/sites/default/files/7.x-1.2/islandora_importer-7.x-1.2.zip
unzip $SRC_DIR/islandora_importer-7.x-1.2.zip -d $SITES_ALL_MODULES
wget -P $SRC_DIR http://islandora.ca/sites/default/files/7.x-1.2/islandora_book_batch-7.x-1.2.zip
unzip $SRC_DIR/islandora_book_batch-7.x-1.2.zip -d $SITES_ALL_MODULES
wget -P $SRC_DIR http://islandora.ca/sites/default/files/7.x-1.2/islandora_bookmark-7.x-1.2.zip
unzip $SRC_DIR/islandora_bookmark-7.x-1.2.zip -d $SITES_ALL_MODULES
wget -P $SRC_DIR http://islandora.ca/sites/default/files/7.x-1.2/islandora_oai-7.x-1.2.zip
unzip $SRC_DIR/islandora_oai-7.x-1.2.zip -d $SITES_ALL_MODULES
wget -P $SRC_DIR http://islandora.ca/sites/default/files/7.x-1.2/islandora_ocr-7.x-1.2.zip
unzip $SRC_DIR/islandora_ocr-7.x-1.2.zip -d $SITES_ALL_MODULES
wget -P $SRC_DIR http://islandora.ca/sites/default/files/7.x-1.2/islandora_marcxml-7.x-1.2.zip
unzip $SRC_DIR/islandora_marcxml-7.x-1.2.zip -d $SITES_ALL_MODULES
wget -P $SRC_DIR http://islandora.ca/sites/default/files/7.x-1.2/islandora_openseadragon-7.x-1.2.zip
unzip $SRC_DIR/islandora_openseadragon-7.x-1.2.zip -d $SITES_ALL_MODULES
wget -P $SRC_DIR http://islandora.ca/sites/default/files/7.x-1.2/islandora_simple_workflow-7.x-1.2.zip
unzip $SRC_DIR/islandora_simple_workflow-7.x-1.2.zip -d $SITES_ALL_MODULES
wget -P $SRC_DIR http://islandora.ca/sites/default/files/7.x-1.2/islandora_internet_archive_bookreader-7.x-1.2.zip
unzip $SRC_DIR/islandora_internet_archive_bookreader-7.x-1.2.zip -d $SITES_ALL_MODULES
wget -P $SRC_DIR http://islandora.ca/sites/default/files/7.x-1.2/islandora_solr_search-7.x-1.2.zip
unzip $SRC_DIR/islandora_solr_search-7.x-1.2.zip -d $SITES_ALL_MODULES
wget -P $SRC_DIR http://islandora.ca/sites/default/files/7.x-1.2/islandora_solr_views-7.x-1.2.zip
unzip $SRC_DIR/islandora_solr_views-7.x-1.2.zip -d $SITES_ALL_MODULES
#
# Additional Drupal Modules
#
wget -P $SRC_DIR http://ftp.drupal.org/files/projects/libraries-7.x-2.1.tar.gz
unzip $SRC_DIR/libraries-7.x-2.1.tar.gz -d $SITES_ALL_MODULES
wget -P $SRC_DIR http://ftp.drupal.org/files/projects/imagemagick-7.x-1.0.zip
unzip $SRC_DIR/imagemagick-7.x-1.0.zip -d $SITES_ALL_MODULES
## install jwplayer
## 
#
# git repo
#
#get a copy of https://github.com/Islandora/tuque put it in $SITES_ALL_LIB
#
# get drupal_filter
#
wget -P $SRC_DIR http://islandora.ca/sites/default/files/12.1.0/drupal_filter.tar.gz
tar -zxvf drupal_filter.tar.gz
mv bin drupal_filter
#
# add drupal filter
#
cp drupal_filter/fcrepo-drupalauthfilter-3.4.2.jar ${FEDORA_HOME}/tomcat/webapps/fedora/WEB-INF/lib/

#
# set up jaas.conf 
#
mv ${FEDORA_HOME}/server/config/jaas.conf ${FEDORA_HOME}/server/config/jaas.conf-orig
cp drupal_filter/jaas.conf ${FEDORA_HOME}/server/config/jaas.conf

#
# install filter config
#
cp drupal_filter/filter-drupal.xml ${FEDORA_HOME}/server/config/filter-drupal.xml

#
# Proxy pass config https://wiki.duraspace.org/pages/viewpage.action?pageId=34658947
#
#cat apache-proxy-pass.cfg >> $WEB_ROOT/.htaccess
#
# contents of apache-proxy-pass.cfg
#ProxyRequests Off 
#ProxyPreserveHost On
#<Proxy \*> 
    #Order deny,allow 
    #Allow from all 
#</Proxy>
#ProxyPass /fedora/get http://localhost:8080/fedora/get
#ProxyPassReverse /fedora/get http://localhost:8080/fedora/get 
#ProxyPass /fedora/services http://localhost:8080/fedora/services 
#ProxyPassReverse /fedora/services http://localhost:8080/fedora/services 
#ProxyPass /fedora/describe http://localhost:8080/fedora/describe 
#ProxyPassReverse /fedora/describe http://localhost:8080/fedora/describe
#ProxyPass /iiv http://localhost:8080/iiv
#ProxyPassReverse /iiv http://localhost:8080/iiv
#ProxyPass /fedora/risearch http://localhost:8080/fedora/risearch 
#ProxyPassReverse /fedora/risearch http://localhost:8080/fedora/risearch
#ProxyPass /adore-djatoka http://localhost:8080/adore-djatoka
#ProxyPassReverse /adore-djatoka http://localhost:8080/adore-djatoka


#
# install updated tomcat startup for Djatoka
#
#mv ${FEDORA_HOME}/tomcat/bin/startup.sh ${FEDORA_HOME}/tomcat/bin/startup.sh-orig
#cp ${HOME}/src/startup.sh ${FEDORA_HOME}/tomcat/bin/startup.sh
