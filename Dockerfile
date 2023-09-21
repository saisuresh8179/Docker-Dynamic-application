FROM ubuntu as build
RUN apt update
RUN apt install unzip -y
RUN apt install git -y && \
    apt install default-jdk -y && \
    apt install maven -y
WORKDIR  /opt/tomcat/
RUN unzip apache-tomcat-10.1.13.zip -d /opt/tomcat/
RUN mv /opt/tomcat/apache-tomcat-10.1.13 /opt/tomcat/tomcat10
WORKDIR /home/ubuntu/java-app/
RUN git clone https://github.com/saisuresh8179/Dynamic-application.git
WORKDIR /home/ubuntu/java-app/Dynamic-application/
RUN mvn clean package

FROM openjdk:8-jre-alpine3.9 java
WORKDIR /app
COPY /home/ubuntu/java-app/Dynamic-application/target/*.jar /app/
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app/*.jar"]
