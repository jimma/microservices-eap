#!/bin/bash
${JBOSS_HOME}/bin/standalone.sh&
sleep 5
${JBOSS_HOME}/bin/jboss-cli.sh --connect <<EOF
batch
module add --name=org.mysql --resources=/mysql-connector-java-5.1.25.jar --dependencies=javax.api,javax.transaction.api
/subsystem=datasources/jdbc-driver=mysql:add(driver-module-name=org.mysql,driver-name=mysql,driver-class-name=com.mysql.jdbc.Driver)
deploy /sales.war
run-batch
exit
EOF
${JBOSS_HOME}/bin/jboss-cli.sh --connect shutdown
${JBOSS_HOME}/bin/standalone.sh
