# Things Needed For Setup

# Prerequisites

## Install NeoVim

```
brew install neovim
```

## Install ripgrep

```
brew install ripgrep
```

## Install Oh-My-Zsh

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Install Packer

```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

## Install Zoxide

```
brew install zoxide
```

# Install tmux

```
brew install tmux
```

# Install tmuxinator

```
brew install tmuxinator
```

# Install TPM

```
git clone https://github.com/tmux-plugins/tpm ~/dotfiles/tmux/plugins
```

# After Installation

## Linking .zshrc file

```
ln -s ~/dotfiles/oh-my-zsh/zshrc ~/.zshrc
```

## Linking neovim config

```
ln -s ~/dotfiles/nvim ~/.config/nvim
```

## Linking tmux config

```
ln -s ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf
```

## ZSH Theme & Plugins

```
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

## iTerm Color Theme

```
curl https://raw.githubusercontent.com/josean-dev/dev-environment-files/main/coolnight.itermcolors --output ~/Downloads/coolnight.itermcolors
```

Then: iTerm Settings > Profiles > Colors > Color Presets > Import from Downloads Folder
