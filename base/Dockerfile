FROM ubuntu:java-8
LABEL MAINTAINER="akshay"
WORKDIR /usr/local
ADD https://archive.apache.org/dist/hadoop/core/hadoop-1.2.1/hadoop-1.2.1.tar.gz .
RUN tar -xvf hadoop-1.2.1.tar.gz
RUN mv hadoop-1.2.1/* hadoop
RUN chown -R hduser:hadoop hadoop
RUN chown -R hduser:hadoop /home/hduser/.ssh
RUN JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
RUN PATH=$PATH:$JAVA_HOME/bin
ENV HADOOP_HOME=/usr/local/hadoop
ENV HADOOP_INSTALL=$HADOOP_HOME
ENV HADOOP_MAPRED_HOME=$HADOOP_HOME
ENV HADOOP_COMMON_HOME=$HADOOP_HOME
ENV HADOOP_HDFS_HOME=$HADOOP_HOME
ENV YARN_HOME=$HADOOP_HOME
ENV HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native
ENV PATH=$PATH:$HADOOP_HOME/sbin:$HADOOP_HOME/bin
ENV HADOOP_OPTS="-Djava.library.path=$HADOOP_HOME/lib/native"

COPY core-site.xml /usr/local/hadoop/conf/core-site.xml
COPY mapred-site.xml /usr/local/hadoop/conf/mapred-site.xml
COPY hdfs-site.xml /usr/local/hadoop/conf/hdfs-site.xml
COPY hadoop-env.sh /usr/local/hadoop/conf/hadoop-env.sh
COPY masters /usr/local/hadoop/conf/masters
COPY slaves /usr/local/hadoop/conf/slaves
RUN mkdir -p /app/hadoop/tmp
RUN chown -R hduser:hadoop /app/hadoop/tmp
EXPOSE 50075 50070 50060 50030 54310 54311
WORKDIR /usr/local/hadoop/bin
RUN chmod 750 /app/hadoop/tmp
