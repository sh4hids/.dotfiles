#!/bin/bash

cd ~
sudo apt-get update -qq

command -v git >/dev/null 2>&1 ||
{ echo >&2 "Git is not installed. Installing..";
  sudo apt-get install -yy git
}

command -v zsh >/dev/null 2>&1 ||
{ echo >&2 "Zsh is not installed. Installing..";
  sudo apt-get install -yy zsh
  sudo chsh -s $(which zsh)
}

# rm -rf ~/.dotfiles
# git clone https://github.com/sh4hids/.dotfiles.git

echo 'Installing ohmyzsh...'
rm -rf ~/.oh-my-zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

ln -sf ~/.dotfiles/zsh/themes/mavit.zsh-theme ~/.oh-my-zsh/themes/mavit.zsh-theme

rm -rf ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/lukechilds/zsh-nvm ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-nvm
ln -sf ~/.dotfiles/zsh/.zshrc ~/.zshrc

# command -v nvm >/dev/null 2>&1 ||
# { echo >&2 "Nvm is not installed. Installing..";
#   mkdir ~/.nvm
#   wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
#   source ~/.zshrc
# }

command -v node >/dev/null 2>&1 ||
{ echo >&2 "Node is not installed. Installing..";
  nvm install --lts
  node -v
}

command -v nvim >/dev/null 2>&1 ||
{ echo >&2 "Nvim is not installed. Installing..";
  wget --quiet https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage --output-document nvim
  chmod +x nvim
  sudo chown root:root nvim
  sudo mv nvim /usr/bin
}

ln -sf ~/.dotfiles/nvim ~/.config/nvim

command -v pip3 >/dev/null 2>&1 ||
{ echo >&2 "Pip3 is not installed. Installing..";
  sudo apt-get install -yy python3-pip
}

pip3 install pynvim
