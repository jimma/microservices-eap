#Use image built from eap folder 
FROM eap6
ADD mysql-connector-java-5.1.25.jar /mysql-connector-java-5.1.25.jar
ADD product.war /product.war
ADD product.sh /product.sh
CMD ["/product.sh"]
