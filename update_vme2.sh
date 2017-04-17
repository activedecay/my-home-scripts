#!/bin/sh
cd /root
rm vme2.war
/etc/init.d/vme2 stop
wget http://hub/builds/nacelle-master/lastSuccessful/prod/vme2/vme2.war
rm /var/lib/vme2/webapps/ROOT.war
rm -rf /var/lib/vme2/webapps/ROOT
cp vme2.war /opt/fio/vme2/webapps/vme2.war
/etc/init.d/vme2 start