FROM openjdk:8-jre-alpine3.9
MAINTAINER Salvio Furbino Elias <salviof@gmail.com>
COPY CNDProxyS3.jar /home/git/publicados/CNDProxyS3/CNDProxyS3.jar
ADD timezone /home/servidorSBFW/timezone
workdir WORKDIR /home/git/publicados/CNDProxyS3/
USER root
ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
#RUN fc-cache -f -v
EXPOSE 8666
RUN java -jar /home/servidorSBFW/timezone/tzupdater.jar -f -l file:///home/servidorSBFW/timezone/tzdata-latest-2022.tar.gz
CMD ["java", "-jar", "/home/git/publicados/CNDProxyS3/CNDProxyS3.jar"]
