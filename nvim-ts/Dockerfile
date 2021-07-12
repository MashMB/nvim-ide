# Docker file for Neovim Typescript development.
#
# @author Maciej Bedra

# Base Neovim image.
FROM mashmb/nvim:1.0.0

# Install Typescript SDK.
RUN apt-get update && apt-get -y install watchman && npm install -g typescript

# Install Python language debugger adapter.
RUN cd /root/.config/nvim/plugins/vimspector && python3 install_gadget.py --force-enable-node

# Copy Neovim configuration files.
COPY ./config/ /root/.config/nvim/

# Avoid container exit.
CMD ["tail", "-f", "/dev/null"]
