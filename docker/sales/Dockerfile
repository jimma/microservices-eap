#Use image built from eap folder 
FROM eap6
ADD mysql-connector-java-5.1.25.jar /mysql-connector-java-5.1.25.jar
ADD sales.war /sales.war
ADD sales.sh /sales.sh
CMD ["/sales.sh"]
