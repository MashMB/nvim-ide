# Docker file for Neovim Go development.
#
# @author Maciej Bedra

# Base Neovim image.
FROM mashmb/nvim:dev

# Neovim COC extensions for Go development.
ARG COC='coc-go'

# Install Go SDK.
RUN apt-get update && apt-get -y install golang 

# Install Go language server.
RUN go install golang.org/x/tools/gopls@latest

# Install Neovim COC extensions.
RUN cd /root/.config/coc/extensions && npm install $COC --global --only=prod

# Install Go language debugger adapter.
RUN cd /root/.config/nvim/plugins/vimspector && python3 install_gadget.py --enable-go && go install github.com/go-delve/delve/cmd/dlv@latest

# Copy Neovim configuration files.
COPY ./config/ /root/.config/nvim/

# Avoid container exit.
CMD ["tail", "-f", "/dev/null"]
