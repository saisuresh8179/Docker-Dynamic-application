FROM maven as mvn1
WORKDIR /app
COPY . .
RUN mvn clean install

FROM tomcat
COPY --from=mvn1 /app/target/*.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh","run"]
