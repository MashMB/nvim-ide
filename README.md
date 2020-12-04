# Neovim IDE

Neovim as IDE in Docker container. The idea is to create comfy programming environment for various languages with usage
of Docker. On host machine there should be the least of dependencies connected with development environment. Only Docker
should be required, so development environment can be used on any computer - work, private or even VPS. Base image will
contain Git and Neovim installation with basic configuration for itself and extensions like file explorer, Git 
integration, support for files like JSON, HTML, CSS, etc. From base image there will be created images for specific 
programming languages, so base configuration will be extended per programming language.

All images build with this repository will be available on [Docker Hub](https://hub.docker.com/u/mashmb).

<p align="center">
  <img src="img/coc.png"/>
</p>

<p align="center">
  <img src="img/git.png"/>
</p>

<p align="center">
  <img src="img/files-tree.png"/>
</p>

## Images

Detailed images description (every directory matches single image, directory name represents image name).

### nvim

Base Neovim image. Software installed:

1. **curl** - for downloading stuff
2. **fzf** - for fast files search
3. **ripgrep** - for fast text occurrence search
4. **Git** - Git support inside container
5. **tig** - Git visualization inside terminal
6. **xclip** - clipboard handling
7. **Python 3** - for proper Neovim work
8. **pip** - for Python 3
9. **NodeJS** - for proper Neovim work
10. **npm** - for NodeJS

All components for Neovim are installed (pynvim with pip and neovim with npm).

Image contains general settings and some key bindings for Neovim (saved in **/root/.config/nvim/general/**).

Spell check for English and Polish is added.

Extensions are managed by Vim Plug. Installed and configured extensions:

1. Gruvbox theme
2. Airline status bar
3. Files tree (with Git integration and icons pack)
4. Welcome screen
5. Fuzzy finder (search for file and text occurrence)
7. Git integration
8. Conquer of completion:
  1. Code completion
  2. Code documentation
  3. Symbols and references highlighting
  4. Code formatting
  5. Code actions (optimize imports, generate, etc.)
  6. Project scope renaming
  7. Go to definition
  8. Go to type definition
  9. Go to implementation
  10. Go to declaration
  11. References
  12. Quick fix
  13. Code diagnostics
  14. Code outline
  15. Symbols search

Supported languages:

1. CSS
2. HTML
3. JavaScript
4. JSON
5. SH
6. SQL
7. YAML
