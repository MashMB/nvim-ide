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

How to run image? For testing it could be:

```shell
docker run -it mashmb/nvim:[tag] /bin/bash
```

For work suggested is **docker-compose.yml** file where configuration will be more tidy. Programming projects should
be mounted from host to **/root/workspace/** directory:

```yml
version: '3.8'

services:
  nvim:
    image: mashmb/nvim:[tag]
    deploy:
      replicas: 1
      resources:
        limits:
          memory: 2G
    volumes:
      - [path_to_projects]:/root/workspace
```

### nvim

Base Neovim image. Software installed:

1. **curl** - for downloading stuff
2. **fzf** - for fast files search
3. **ripgrep** - for fast text occurrence search
4. **Git** - Git support inside container
5. **tree** - files tree visualization
6. **Lazygit** - Git visualization inside terminal
7. **xclip** - clipboard handling
8. **Python 3** - for proper Neovim work
9. **pip** - for Python 3
10. **NodeJS** - for proper Neovim work
11. **npm** - for NodeJS
12. **tzdata** - for default container timezone settings

All components for Neovim are installed (pynvim with pip and neovim with npm).

Image contains general settings and some key bindings for Neovim (saved in **/root/.config/nvim/general/**).

Spell check for English and Polish is added.

Europe/Warsaw as default timezone.

Extensions are managed by Vim Plug. Installed and configured extensions:

1. Gruvbox theme
2. Airline status bar
3. Files tree (with Git integration and icons pack)
4. Welcome screen
5. Fuzzy finder (search for file and text occurrence)
7. Git integration
8. Hex colors preview support
9. Conquer of completion:
    - Code completion
    - Code documentation
    - Symbols and references highlighting
    - Code formatting
    - Code actions (optimize imports, generate, etc.)
    - Project scope renaming
    - Go to definition
    - Go to type definition
    - Go to implementation
    - Go to declaration
    - References
    - Quick fix
    - Code diagnostics
    - Code outline
    - Symbols search
9. Debugger

Supported languages:

1. CSS
2. HTML
3. JavaScript
4. JSON
5. SH
6. SQL
7. YAML

For users that type really fast on keyboard, Conquer of Completion can be too slow. You can disable auto completion with 
setting in **coc-settings.json**:

```
"suggest.autoTrigger": "none"
```

Completion will be available on shortcut **Ctrl + Space**.

Additionally there are some Bash aliases:

```
alias cl="clear"
alias ls="ls -al --color"
alias du="du -h"
alias lg="lazygit"
alias gs="git status"
alias gb="git branch -a"
alias gp="git push origin"
alias gps="git push --set-upstream origin"
alias gc="git checkout"
alias gcb="git checkout -b"
```

Neovim background is transparent. It can be disabled in Neovim configuration (.config/nvim/general/settings.vim line **85**).

### nvim-flutter

Image dedicated for Flutter development. It is overriding the base **nvim** image. Conquer of completion is realized 
with:

- coc-flutter
- dart-vim-plugin (syntax highlighting)

This image contains raw Flutter installation (no Android SDK, etc.).

For Android development follow the [tutorial](https://dev.to/enriquem/android-sdk-without-studio-3idg). There are two
ways to run Android emulator:

1. Install and configure `xauth` ([tutorial](https://www.geeksforgeeks.org/running-gui-applications-on-docker-in-linux/)), 
nextly install emulator in container and run it (remember about Docker privileged mode - without it there will be no 
hardware acceleration required by emulator).
2. Install Android SDK on host and in Docker container, connect to emulator on host over `adb`.

### nvim-go

Image dedicated for Go development. It is overriding the base **nvim** image. Conquer of completion is realized with:

- coc-go
- gopls

Image has configured debugger for Go development with usage of **vimspector** (required **Delve** is installed also).

### nvim-jdk8

Image dedicated for Oracle Java 8 development. It is overriding the base **nvim** image. Conquer of completion is
realized with:

- coc-java
- [Eclipse JDT Language Server](https://download.eclipse.org/jdtls/milestones/0.57.0/) (for Oracle Java 8, version 
0.57.0 is required)

Image has configured debugger for Oracle Java 8 with usage of **vimspector** and 
[coc-java-debug](https://github.com/dansomething/coc-java-debug).

Additionally **coc-xml** is installed for proper XML files handling with Java.

**NOTE**: to use [Lombok](https://projectlombok.org/) it should be downloaded and mounted to container. Nextly it should
be configured in **coc-settings.json**:

```json
{
  "java.jdt.ls.vmargs": "-javaagent:[path]/lombok.jar"
  // "java.jdt.ls.vmargs": "-javaagent:[path]/lombok.jar -Xbootclasspath/a:[path]/lombok.jar" // older Java versions
}
```

### nvim-latex

Image dedicated for LaTeX files edition. It is overriding the base **nvim** image. Conquer of completion is realized with:

- coc-texlab

PDF output file can be built with `:CocCommand latex.Build [file.pdf]`

### nvim-ojdk11

Image dedicated for OpenJDK 11 (Java 11) development. It is overriding the base **nvim** image. Conquer of completion is
realized with:

- coc-java
- [Eclipse JDT Language Server](https://download.eclipse.org/jdtls/)

Image has configured debugger for OpenJDK 11 with usage of **vimspector** and 
[coc-java-debug](https://github.com/dansomething/coc-java-debug).

Additionally **coc-xml** is installed for proper XML files handling with Java.

**NOTE**: to use [Lombok](https://projectlombok.org/) it should be downloaded and mounted to container. Nextly it should
be configured in **coc-settings.json**:

```json
{
  "java.jdt.ls.vmargs": "-javaagent:[path]/lombok.jar"
  // "java.jdt.ls.vmargs": "-javaagent:[path]/lombok.jar -Xbootclasspath/a:[path]/lombok.jar" // older Java versions
}
```

### nvim-python3

Image dedicated for Python3 development. It is overriding the base **nvim** image. Conquer of completion is realized with:

- coc-pyright
- coc-python
- jedi-language-server

Image has configured debugger for Python3 development with usage of **vimspector**. 

All dependencies used to Python3 development are installed in virtual environment (/root/.env) so it can be easily
modified with usage of volumes mounting. All user created virtual environments should be mounted in /root/envs.

For more flexible workspace manging, *pyrightconfig.json* file can be created and mounted in */root/* directory. Example 
configuration used to avoid import errors in workspace without *env*:

```json
{
  "reportMissingImports": false,
  "reportGeneralTypeIssues": false
}
```
