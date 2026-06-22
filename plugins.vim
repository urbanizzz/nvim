" Установка vim-plug
if empty(glob("$HOME/.config/nvim/autoload/plug.vim"))
    execute '!curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('$HOME/.config/nvim/plugged')
" NERDTree
Plug 'scrooloose/nerdtree'

" Официальный конфигуратор нативных серверов
Plug 'neovim/nvim-lspconfig'

" Движок автодополнения и его мост к LSP
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
call plug#end()


" execute when is need to install a new plugin
" PlugInstall


