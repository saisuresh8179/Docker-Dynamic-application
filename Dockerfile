FROM tomcat as tom
COPY target/01-maven-web-app.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh","run"]
