# Docker file for Neovim LaTeX editor.
#
# @author Maciej Bedra

# Base Neovim image.
FROM mashmb/nvim:1.0.0

# Install LaTeX.
RUN apt-get update && apt-get -y install texlive-full

# Neovim COC extensions for LaTeX edition.
ARG COC='coc-texlab'

# Install Neovim COC extensions.
RUN cd /root/.config/coc/extensions && npm install $COC --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod

# Copy Neovim configuration files.
COPY ./config/ /root/.config/nvim/

# Avoid container exit.
CMD ["tail", "-f", "/dev/null"]
