# Docker file for base Neovim image.
#
# @author Maciej Bedra

# Debian image as base (unstable for newest software).
FROM debian:sid-20201117

# Set image locale.
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en

# Expose some ports to host by default.
EXPOSE 8080 8081 8082 8083 8084 8085

# Define which Neovim COC extensions should be installed.
ARG COC='coc-css coc-eslint coc-html coc-json coc-sh coc-sql coc-tsserver coc-yaml'

# Update repositories and install software:
# 1. curl.
# 2. fzf for fast file search.
# 3. ripgrep for fast text occurrence search.
# 4. Git.
# 5. tig for Git visualization.
# 6. xclip for clipboard handling.
# 7. Python 3.
# 8. pip for Python.
# 9. NodeJS.
# 10. npm for NodeJS.
# 11. Neovim.
# 12. tzdata to set default container timezone
RUN apt-get update && apt-get -y install curl fzf ripgrep git tig xclip python3 python3-pip nodejs npm neovim tzdata

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

# Create directory for Neovim COC extensions.
RUN mkdir -p /root/.config/coc/extensions

# Install Neovim COC extensions.
RUN cd /root/.config/coc/extensions && npm install $COC --global --only=prod

# Create directory for projects (there should be mounted from host).
RUN mkdir -p /root/workspace

# Set default location after container startup.
WORKDIR /root/workspace

# Set default timezone.
ENV TZ=Europe/Warsaw

# Avoid container exit.
CMD ["tail", "-f", "/dev/null"]
