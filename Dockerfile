FROM maven as maven
WORKDIR /app
COPY . .
RUN mvn clean install

FROM tomcat
COPY --from=maven /app/target/*.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh","run"]
