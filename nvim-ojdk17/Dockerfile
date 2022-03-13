# Docker file for Neovim Open JDK 17 (Java 17) development.
#
# @author Maciej Bedra

# Base Neovim image.
FROM mashmb/nvim:dev

# Install Open JDK 17.
RUN apt-get update && apt-get -y install openjdk-17-jdk 

# Neovim COC extensions for Java development.
ARG COC='coc-java coc-java-debug coc-xml'

# Install Neovim COC extensions.
RUN cd /root/.config/coc/extensions && npm install $COC --global --only=prod

# Copy Neovim configuration files.
COPY ./config/ /root/.config/nvim/

# Avoid container exit.
CMD ["tail", "-f", "/dev/null"]
