#!/bin/bash
# 
# All Neovim IDE images build and Docker Hub push script (useful for group rebuilding).
#
# @author Maciej Bedra

# Log in to Docker Hub.
docker login

# Workdir.
pwd

# Build Neovim IDE images.
cd nvim && pwd && docker build -t mashmb/nvim:1.0.0 . && cd ..
cd nvim-flutter && pwd && docker build -t mashmb/nvim-flutter:1.0.0 . && cd ..
cd nvim-go && pwd && docker build -t mashmb/nvim-go:1.0.0 . && cd ..
cd nvim-jdk8 && pwd && docker build -t mashmb/nvim-jdk8:1.0.0 . && cd ..
cd nvim-latex && pwd && docker build -t mashmb/nvim-latex:1.0.0 . && cd ..
cd nvim-ojdk11 && pwd && docker build -t mashmb/nvim-ojdk11:1.0.0 . && cd ..
cd nvim-python3 && pwd && docker build -t mashmb/nvim-python3:1.0.0 . && cd ..

# Push images to Docker Hub.
docker push mashmb/nvim:1.0.0
docker push mashmb/nvim-flutter:1.0.0
docker push mashmb/nvim-go:1.0.0
docker push mashmb/nvim-jdk8:1.0.0
docker push mashmb/nvim-latex:1.0.0
docker push mashmb/nvim-ojdk11:1.0.0
docker push mashmb/nvim-python3:1.0.0

# Clean images after build and push.
docker image rm -f mashmb/nvim:1.0.0
docker image rm -f mashmb/nvim-flutter:1.0.0
docker image rm -f mashmb/nvim-go:1.0.0
docker image rm -f mashmb/nvim-jdk8:1.0.0
docker image rm -f mashmb/nvim-latex:1.0.0
docker image rm -f mashmb/nvim-ojdk11:1.0.0
docker image rm -f mashmb/nvim-python3:1.0.0
