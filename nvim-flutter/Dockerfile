# Docker file for Neovim Flutter development.
#
# @author Maciej Bedra

# Base Neovim image.
FROM mashmb/nvim:1.0.0

# Neovim COC extensions for Flutter development.
ARG COC='coc-flutter'

# Install necessary system utilities.
RUN apt-get update && apt-get -y install unzip xz-utils zip

# Install Flutter.
RUN cd /root && git clone https://github.com/flutter/flutter.git -b stable --depth 1
RUN /root/flutter/bin/flutter doctor

# Add Flutter to PATH.
COPY ./home/ /root/

# Install Neovim COC extensions.
RUN cd /root/.config/coc/extensions && npm install $COC --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod

# Copy Neovim configuration files.
COPY ./config/ /root/.config/nvim/

# Install Neovim extensions.
RUN nvim --headless +PlugInstall +qall

# Avoid container exit.
CMD ["tail", "-f", "/dev/null"]
