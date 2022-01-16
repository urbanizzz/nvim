" Установка vim-plug
if empty(glob("$HOME/.config/nvim/autoload/plug.vim"))
    execute '!curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('$HOME/.config/nvim/plugged')
Plug 'scrooloose/nerdtree'
call plug#end()

" execute when is need to install a new plugin
" PlugInstall


