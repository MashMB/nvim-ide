# Docker file for base Neovim image.
#
# @author Maciej Bedra

# Debian image as base (unstable for newest software).
FROM debian:sid-20210408

# Set image locale.
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en

# Expose some ports to host by default.
EXPOSE 8080 8081 8082 8083 8084 8085

# Define which Neovim COC extensions should be installed.
ARG COC='coc-css coc-eslint coc-html coc-json coc-sh coc-sql coc-tsserver coc-yaml'

# Lazygit variables
ARG LG='lazygit'
ARG LG_GITHUB='https://github.com/jesseduffield/lazygit/releases/download/v0.28.1/lazygit_0.28.1_Linux_x86_64.tar.gz'
ARG LG_ARCHIVE='lazygit.tar.gz'

# Update repositories and install software:
# 1. curl.
# 2. fzf for fast file search.
# 3. ripgrep for fast text occurrence search.
# 4. tree for files tree visualization.
# 5. Git.
# 6. Lazygit for Git visualization.
# 7. xclip for clipboard handling.
# 8. Python 3.
# 9. pip for Python.
# 10. NodeJS.
# 11. npm for NodeJS.
# 12. Neovim.
# 13. tzdata to set default container timezone
RUN apt-get update && apt-get -y install curl fzf ripgrep tree git xclip python3 python3-pip nodejs npm neovim tzdata

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

# Install Lazygit from binary
RUN mkdir -p /root/TMP && cd /root/TMP && curl -L -o $LG_ARCHIVE $LG_GITHUB
RUN cd /root/TMP && tar xzvf $LG_ARCHIVE && mv $LG /usr/bin/
RUN rm -rf /root/TMP

# Bash aliases
COPY ./home/ /root/

# Create directory for projects (there should be mounted from host).
RUN mkdir -p /root/workspace

# Set default location after container startup.
WORKDIR /root/workspace

# Set default timezone.
ENV TZ=Europe/Warsaw

# Avoid container exit.
CMD ["tail", "-f", "/dev/null"]
