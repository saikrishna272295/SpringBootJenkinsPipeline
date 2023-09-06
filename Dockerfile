FROM openjdk
EXPOSE 8080
ADD target/springboot-jenkins-pipeline.jar springboot-jenkins-pipeline.jar
ENTRYPOINT ["java", "-jar","/springboot-jenkins-pipeline.jar"]