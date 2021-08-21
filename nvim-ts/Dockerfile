# Docker file for Neovim Typescript development.
#
# @author Maciej Bedra

# Base Neovim image.
FROM mashmb/nvim:dev

# Install Typescript SDK.
RUN apt-get update && apt-get -y install watchman && npm install -g typescript

# Install Node.js debugger adapter.
RUN cd /root/.config/nvim/plugins/vimspector && python3 install_gadget.py --force-enable-node

# Copy Neovim configuration files.
COPY ./config/ /root/.config/nvim/

# Avoid container exit.
CMD ["tail", "-f", "/dev/null"]
