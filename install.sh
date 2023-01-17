#!/bin/bash

# PACKAGES
sudo apt install git curl wget jq ripgrep tmux docker.io docker-compose

# NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# NODE
nvm install v18.13.0
npm i -g nodemon
npm i -g prettier

# NEOVIM
wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
tar xvzf nvim-linux64.tar.gz
mkdir -p ~/.local
cp -r nvim-linux64/* ~/.local
rm nvim-linux64.tar.gz
rm -rf nvim-linux64

# PLUG
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# COPY CONFIGS
mkdir -p ~/.config/nvim
cp init.vim ~/.config/nvim
cp .tmux.conf ~/

# FZF
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# NVIM PLUGINS
~/.local/bin/nvim +PlugInstall +qall

# GIT
git config --global user.name "kiwphi"
git config --global user.email "120708663+kiwphi@users.noreply.github.com"
ssh-keygen -t ed25519 -C "120708663+kiwphi@users.noreply.github.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
echo "*****"
cat ~/.ssh/id_ed25519.pub
