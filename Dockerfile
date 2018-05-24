# Start with Oracle Linux
FROM oraclelinux:7-slim

# Parameters
ENV JAVA_PKG=lib/serverjre-9.0.4_linux-x64_bin.tar.gz \
    JAVA_HOME=/usr/java/default \
    RAMP_OC_PKG=lib/omnicache-v2.0.1

# Install Java Runtime
ADD $JAVA_PKG /usr/java/
RUN export JAVA_DIR=$(ls -1 -d /usr/java/*) && \
    ln -s $JAVA_DIR /usr/java/latest && \
    ln -s $JAVA_DIR /usr/java/default && \
    alternatives --install /usr/bin/java java $JAVA_DIR/bin/java 20000 && \
    alternatives --install /usr/bin/javac javac $JAVA_DIR/bin/javac 20000 && \
    alternatives --install /usr/bin/jar jar $JAVA_DIR/bin/jar 20000

# Copy Library Files
ADD $RAMP_OC_PKG /
# COPY template-config.json /
# COPY docker-entry.sh /

# Start Container
# CMD ["./docker-entry.sh"]
CMD ["./omnicache.sh"]
