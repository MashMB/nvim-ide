# Docker file for Neovim Go development.
#
# @author Maciej Bedra

# Base Neovim image.
FROM mashmb/nvim:1.0.0

# Neovim COC extensions for Go development.
ARG COC='coc-go'

# Install Go SDK.
RUN apt-get update && apt-get -y install golang 

# Install Go language server.
RUN mkdir -p /root/go/TMP
RUN cd /root/go/TMP && go mod init tmp && go get golang.org/x/tools/gopls@latest
RUN rm -rf /root/go/TMP

# Install Neovim COC extensions.
RUN cd /root/.config/coc/extensions && npm install $COC --global --only=prod

# Install Go language debugger adapter.
RUN cd /root/.config/nvim/plugins/vimspector && python3 install_gadget.py --enable-go && go get -u github.com/go-delve/delve/cmd/dlv

# Copy Neovim configuration files.
COPY ./config/ /root/.config/nvim/

# Avoid container exit.
CMD ["tail", "-f", "/dev/null"]
