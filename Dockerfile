FROM Ubuntu
RUN sudo apt update
RUN sudo apt install unzip -y
RUN sudo apt install git -y && \
    sudo apt install default-jdk -y && \
    sudo apt install maven -y
WORKDIR  /opt/tomcat/
RUN ADD https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.13/bin/apache-tomcat-10.1.13.zip /opt/tomcat/
RUN unzip apache-tomcat-10.1.13 /opt/tomcat/tomcat10
WORKDIR /home/ubuntu/java-app/
RUN git clone https://github.com/saisuresh8179/Dynamic-application.git
WORKDIR /home/ubuntu/java-app/Dynamic-application/
RUN mvn clean package
COPY /home/ubuntu/java-app/Dynamic-application/target/*.war /opt/tomcat/tomcat10/webapps/
EXPOSE 8080
CMD [ "/opt/tomcat/tomcat10/bin/catalina.sh","run" ]
