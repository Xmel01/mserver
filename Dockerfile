FROM centos:8

WORKDIR /minecraft

RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN yum -y update && yum clean all

RUN yum -y install wget

RUN yum -y install nano

RUN yum -y install java-17-openjdk

EXPOSE 25565

#COPY spigot-1.19.4.jar /minecraft/

RUN wget https://download.getbukkit.org/spigot/spigot-1.19.4.jar

RUN java -Dfile.encoding=UTF-8 -jar spigot-1.19.4.jar

COPY server.properties /minecraft/

CMD ["java", "-Dfile.encoding=UTF-8", "-Dcom.mojang.eula.agree=true", "-jar", "spigot-1.19.4.jar", "-nogui"]

VOLUME /minecraft