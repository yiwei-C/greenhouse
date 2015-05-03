#!/bin/sh

# Pull latest version of app
cd /usr/local/run/greenhouse
git pull origin master

# Build app
/usr/local/maven/bin/mvn -Dmaven.test.skip=true package

# Copy war to Tomcat
rm -rf $CATALINA_HOME/webapps/*
cp target/greenhouse-1.0.0.BUILD-SNAPSHOT.war $CATALINA_HOME/webapps/ROOT.war

# Start Tomcat
$CATALINA_HOME/bin/startup.sh

# Start nginx
nginx
