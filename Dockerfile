FROM tomcat
MAINTAINER saisuresh8179@gmail.com
COPY **/*.war /usr/var/local/tomcat/webapps
EXPOSE 8080
CMD ["catalina.sh","run"]
