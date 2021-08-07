# Docker file for Neovim Oracle Java 8 development.
#
# @author Maciej Bedra

# Base Neovim image.
FROM mashmb/nvim:1.0.0

# Name of Java JDK 8 archive, installation directory and Java Language Server archive.
ARG JDK='jdk-8u301.tar.gz'
ARG JDK_DIR='jdk1.8.0_301'
ARG JDT='jdt-language-server-0.57.0-202006172108.tar.gz'

# Neovim COC extensions for Java development.
ARG COC='coc-java coc-java-debug coc-xml'

# Create temporal directory for Java JDK 8 archive.
RUN mkdir -p /root/TMP

# Create directory for Java JDK 8 installation.
RUN mkdir -p /usr/lib/jvm

# Copy Java JDK 8 archive.
COPY ./jdk/ /root/TMP/

# Install Java JDK 8 from archive.
RUN cd /root/TMP && tar zxvf $JDK -C /usr/lib/jvm

# Create directory for Java Language Server.
RUN mkdir -p /root/.config/coc/extensions/coc-java-data/server

# Install Java Language Server for COC.
RUN cd /root/TMP && tar zxvf $JDT -C /root/.config/coc/extensions/coc-java-data/server

# Clean Java JDK 8 archive.
RUN rm -rf /root/TMP

# Java JDK 8 alternatives.
RUN update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/$JDK_DIR/bin/java" 1
RUN update-alternatives --set java /usr/lib/jvm/$JDK_DIR/bin/java

# Copy .bashrc with JAVA HOME configured.
COPY ./home/ /root/

# Install Neovim COC extensions.
RUN cd /root/.config/coc/extensions && npm install $COC --global --only=prod

# Copy Neovim configuration files.
COPY ./config/ /root/.config/nvim/

# Avoid container exit.
CMD ["tail", "-f", "/dev/null"]
