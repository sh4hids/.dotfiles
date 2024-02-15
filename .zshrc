# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Lazy load zsh-nvm
export NVM_LAZY_LOAD=true

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="mavit"


# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

unsetopt PROMPT_SP

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

export BAT_THEME="OneHalfDark"
export DENO_INSTALL="/home/sim/.local"
export PATH="$DENO_INSTALL/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin
export GOPATH="$HOME/go_projects"
export GOBIN="$GOPATH/bin"
export QT_SCREEN_SCALE_FACTORS=1
echo -e "\033]32;\007"
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH

source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source "$HOME/.gvm/scripts/gvm"

source ~/.dotfiles/.aliases

export GOPATH="$HOME/.gvm/pkgsets/go1.15.2/global"; export GOROOT="$HOME/.gvm/gos/go1.15.2"; export PATH="$GOPATH/bin:$PATH"; # g-install: do NOT edit, see https://github.com/stefanmaric/g
alias gvm="$GOPATH/bin/g"; # g-install: do NOT edit, see https://github.com/stefanmaric/g

alias luamake=/home/sim/tools/lua-language-server/3rd/luamake/luamake
export PATH="$HOME/tools/lua-language-server/bin/Linux:$PATH"
export GPG_TTY=$(tty)
