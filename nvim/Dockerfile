# Docker file for base Neovim image.
#
# @author Maciej Bedra

# Stable Debian image as base.
FROM debian:stable-20201117

# Expose some ports to host by default.
EXPOSE 8080 8081 8082 8083 8084 8085

# Update repositories and install software:
# 1. curl.
# 2. Git.
# 3. tig for Git visualization.
# 4. xclip for clipboard handling.
# 5. Python 3.
# 6. pip for Python.
# 7. NodeJS.
# 8. npm for NodeJS.
# 9. Neovim.
RUN apt-get update && apt-get -y install curl git tig xclip python3 python3-pip nodejs npm neovim 

# Cooperate Neovim with Python 3.
RUN pip3 install pynvim

# Cooperate NodeJS with Neovim.
RUN npm i -g neovim

# Create directory for Neovim spell check dictionaries.
RUN mkdir -p /root/.local/share/nvim/site/spell

# Copy Neovim dictionaries.
COPY ./spell/ /root/.local/share/nvim/site/spell/

# Install Vim Plug.
RUN curl -fLo /root/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Create directory for Neovim configuration files.
RUN mkdir -p /root/.config/nvim

# Copy Neovim configuration files.
COPY ./config/ /root/.config/nvim/

# Install Neovim extensions.
RUN nvim --headless +PlugInstall +qall

# Create directory for projects (there should be mounted from host).
RUN mkdir -p /root/workspace

# Set default location after container startup.
WORKDIR /root/workspace

# Avoid container exit.
CMD ["tail", "-f", "/dev/null"]
