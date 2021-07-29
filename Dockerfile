FROM maven:3.5-jdk-8 as BUILD

COPY . /usr/src/myapp/src
# COPY pom.xml /usr/src/myapp
RUN mvn -f /usr/src/myapp/pom.xml clean package

# FROM jboss/wildfly:10.1.0.Final

COPY --from=BUILD /usr/src/myapp/target/petclinic.war /usr/local/tomcat/webapps

FROM tomcat
COPY target/ /user/local/tomcat/webapps/