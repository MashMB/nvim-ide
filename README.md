# Neovim IDE

Neovim as IDE in Docker container. The idea is to create comfy programming environment for various languages with usage
of Docker. On host machine there should be the least of dependencies connected with development environment. Only Docker
should be required, so development environment can be used on any computer - work, private or even VPS. Base image will
contain Git and Neovim installation with basic configuration for itself and extensions like file explorer, Git 
integration, support for files like JSON, HTML, CSS, etc. From base image there will be created images for specific 
programming languages, so base configuration will be extended per programming language.

All images build with this repository will be available on [Docker Hub](https://hub.docker.com/u/mashmb).

## Images

Detailed images description (every directory matches single image, directory name represents image name).
