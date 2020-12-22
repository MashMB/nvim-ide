# Docker file for Neovim Python3 development.
#
# @author Maciej Bedra

# Base Neovim image.
FROM mashmb/nvim:1.0.0

# Neovim COC extensions for Python3 development.
ARG COC='coc-pyright coc-python'

# Create directory for virtual environments.
RUN mkdir -p /root/envs

# Prepare main virtual environment (for language server features).
COPY ./env/ /root/
RUN apt-get update && apt-get -y install python3-venv
RUN cd /root && python3 -m venv .env
RUN /root/.env/bin/pip install -r /root/requirements.txt

# Install Neovim COC extensions.
RUN cd /root/.config/coc/extensions && npm install $COC --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod

# Install Python language debugger adapter.
RUN cd /root/.config/nvim/plugins/vimspector && python3 install_gadget.py --enable-python

# Copy Neovim configuration files.
COPY ./config/ /root/.config/nvim/

# Avoid container exit.
CMD ["tail", "-f", "/dev/null"]
