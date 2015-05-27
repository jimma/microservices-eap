#!/bin/bash
${JBOSS_HOME}/bin/standalone.sh -c standalone-ha.xml&
sleep 5
${JBOSS_HOME}/bin/jboss-cli.sh --connect <<EOF
batch
module add --name=org.mysql --resources=/mysql-connector-java-5.1.25.jar --dependencies=javax.api,javax.transaction.api
/subsystem=datasources/jdbc-driver=mysql:add(driver-module-name=org.mysql,driver-name=mysql,driver-class-name=com.mysql.jdbc.Driver)
deploy /billing.war
/subsystem=modcluster/mod-cluster-config=configuration/:write-attribute(name=advertise,value=false)
/subsystem=modcluster/mod-cluster-config=configuration/:write-attribute(name=sticky-session,value=true)
/subsystem=modcluster/mod-cluster-config=configuration/:write-attribute(name=sticky-session-force,value=true)
/subsystem=modcluster/mod-cluster-config=configuration/:write-attribute(name=proxy-list,value="balancer:6666")
run-batch
exit
EOF
${JBOSS_HOME}/bin/jboss-cli.sh --connect shutdown
${JBOSS_HOME}/bin/standalone.sh -c standalone-ha.xml


