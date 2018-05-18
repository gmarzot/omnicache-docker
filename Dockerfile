# LICENSE UPL 1.0
#
# Copyright (c) 2015 Oracle and/or its affiliates. All rights reserved.
#
FROM oraclelinux:7-slim

MAINTAINER Aurelio Garcia-Ribeyro <aurelio.garciaribeyro@oracle.com>

ENV JAVA_PKG=serverjre-9.0.4_linux-x64_bin.tar.gz \
    JAVA_HOME=/usr/java/default \
    RAMP_OC_PKG=omnicache-v2.1.0-main-dev1-138850.zip

ADD $JAVA_PKG /usr/java/
RUN export JAVA_DIR=$(ls -1 -d /usr/java/*) && \
    ln -s $JAVA_DIR /usr/java/latest && \
    ln -s $JAVA_DIR /usr/java/default && \
    alternatives --install /usr/bin/java java $JAVA_DIR/bin/java 20000 && \
    alternatives --install /usr/bin/javac javac $JAVA_DIR/bin/javac 20000 && \
    alternatives --install /usr/bin/jar jar $JAVA_DIR/bin/jar 20000

RUN yum -y install unzip
RUN yum -y install rsync
COPY $RAMP_OC_PKG /tmp
RUN cd /tmp && unzip $RAMP_OC_PKG && rm $RAMP_OC_PKG
RUN cd /tmp/omnicache-* && yes '' | ./installAltimeterLinuxService.sh
RUN rm -rf /tmp/omnicache-*

COPY template-config.json /opt/altimeter-omnicache

COPY docker-entry.sh /opt/altimeter-omnicache
ENTRYPOINT ["/opt/altimeter-omnicache/docker-entry.sh"]
CMD []