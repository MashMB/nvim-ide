# Docker file for Neovim Oracle Java 8 development.
#
# @author Maciej Bedra

# Base Neovim image.
FROM mashmb/nvim:1.0.0

# Name of Java JDK 8 archive and installation directory.
ARG JDK='jdk-8u271-linux-x64.tar.gz'
ARG JDK_DIR='jdk1.8.0_271'

# Create temporal directory for Java JDK 8 archive.
RUN mkdir -p /root/TMP

# Create directory for Java JDK 8 installation.
RUN mkdir -p /usr/lib/jvm

# Copy Java JDK 8 archive.
COPY ./jdk/ /root/TMP/

# Install Java JDK 8 from archive.
RUN cd /root/TMP && tar zxvf $JDK -C /usr/lib/jvm

# Clean Java JDK 8 archive.
RUN rm -rf /root/TMP

# Java JDK 8 alternatives.
RUN update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/$JDK_DIR/bin/java" 1
RUN update-alternatives --set java /usr/lib/jvm/$JDK_DIR/bin/java

# Copy .bashrc with JAVA HOME configured.
COPY ./home/ /root/

# Avoid container exit.
CMD ["tail", "-f", "/dev/null"]
