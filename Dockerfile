FROM ubuntu as build
RUN apt update
RUN apt install git -y && \
    apt install default-jdk -y && \
    apt install maven -y
WORKDIR /home/ubuntu/java-app/
RUN git clone https://github.com/saisuresh8179/Dynamic-application.git
WORKDIR /home/ubuntu/java-app/Dynamic-application/
RUN mvn clean package

FROM tomcat as tomcat
WORKDIR /app
COPY --from=build /home/ubuntu/java-app/Dynamic-application/target/*.war /app/
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app/*.war"]
