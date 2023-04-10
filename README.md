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

# After Installation 
## Linking .zshrc file
```
ln -s ~/dotfiles/oh-my-zsh/zshrc ~/.zshrc
```

## Linking neovim config
```
ln -s ~/dotfiles/nvim ~/.config/nvim
```

## iTerm Color Theme
```
curl https://raw.githubusercontent.com/josean-dev/dev-environment-files/main/coolnight.itermcolors --output ~/Downloads/coolnight.itermcolors
```

Then: iTerm Settings > Profiles > Colors > Color Presets > Import from Downloads Folder



