# vim-nvim-setup
setup for vim/nvim

## how to install

## clone vundle:

```bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

```bash
vim .vimrc
```

In vimrc:

```bash
:PluginInstall:
```

check if plugins are installed:

```bash
:PluginList:
```

## configure nvim to run on vim setup

in nvim: 

```bash
:call mkdir(stdpath('config'), 'p')

:exe 'edit '.stdpath('config').'/init.vim'
```

in init.vim:

```
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
```

## configure vim to run nvim instead of vim (handy)

```bash
CUSTOM_NVIM_PATH=/usr/local/bin/nvim.appimage 
#(set the above with correct path to nvim.appimage)
set -u
sudo update-alternatives --install /usr/bin/ex ex "${CUSTOM_NVIM_PATH}" 110
sudo update-alternatives --install /usr/bin/vi vi "${CUSTOM_NVIM_PATH}" 110
sudo update-alternatives --install /usr/bin/view view "${CUSTOM_NVIM_PATH}" 110
sudo update-alternatives --install /usr/bin/vim vim "${CUSTOM_NVIM_PATH}" 110
sudo update-alternatives --install /usr/bin/vimdiff vimdiff "${CUSTOM_NVIM_PATH}" 110
```

thanks
