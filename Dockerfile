FROM maven as mvn
WORKDIR /app
COPY . .
RUN mvn clean install

FROM tomcat
COPY --from=mvn /app/target/*.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh","run"]
