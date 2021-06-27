" Maintainer:	Yury Oskin <yuraoskin@gmail.com>
" Last change:	2021 Mar 24

" Включаем мышку даже в текстовом режиме
set mouse=a

" " Форма курсора при переходе в режим вставки
" let &t_SI="\<Esc>[3 q"
" " Форма курсора при переходе в режим замены
" let &t_SR="\<Esc>[4 q"
" " Форма курсора при возврате в нормальный режим
" let &t_EI="\<Esc>[2 q"
set gcr=n-v-c-sm:block,i-ci-ve:hor25,r-cr-o:ver25

" Минимальная высота окна
set winminheight=0
" Минимальная ширина окна
set winminwidth=0
" Всегда отображать статусную строку для каждого окна
set laststatus=2

colorscheme challenger_deep
" Включаем подсветку синтаксиса
syntax on
" Включаем отображение номеров строк
set nu

" setup Haskell IDE
source $XDG_CONFIG_HOME/nvim/haskell.vim
" maps 
source $XDG_CONFIG_HOME/nvim/maps.vim
" plugins
source $XDG_CONFIG_HOME/nvim/plugins.vim
" include color select
" source $XDG_CONFIG_HOME/nvim/colorselect.vim

" Опции автодополнения - включаем только меню с доступными вариантами
" автодополнения (также, например, для omni completion может быть
" окно предварительного просмотра).
set completeopt=menu

" Размер табуляции
set tabstop=2
" Размер сдвига при нажатии на клавиши << и >>
set shiftwidth=2
" Копирует отступ от предыдущей строки
set autoindent
set smarttab
set expandtab


" Включаем перенос строк
set wrap
" Перенос строк по словам, а не по буквам
set linebreak

" Включаем отображение выполняемой в данный момент команды в правом нижнем углу экрана.
set showcmd
" Включаем отображение дополнительной информации в статусной строке
set statusline=%<%f%h%m%r%=format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ %b\ 0x%B\ %l,%c%V\ %P

" Включаем подсветку выражения, которое ищется в тексте
set hlsearch
" При поиске перескакивать на найденный текст в процессе набора строки
set incsearch
" Останавливать поиск при достижении конца файла
set nowrapscan
" Игнорировать регистр букв при поиске
set ignorecase

" Отключаем создание бэкапов
set nobackup
" Отключаем создание swap файлов
set noswapfile

" Список кодировок файлов для автоопределения
set fileencodings=utf-8,cp1251,koi8-r,cp866

" Включает виртуальный звонок (моргает, а не бибикает при ошибках)
set visualbell

" Перемещать курсор на следующую строку при нажатии на клавиши вправо-влево и пр.
set whichwrap=b,s,<,>,[,],l,h

" Метод фолдинга - вручную (для обычных файлов)
set foldmethod=manual

" Настраиваем переключение раскладок клавиатуры по <C-^>
set keymap=russian-jcukenwin
" Раскладка по умолчанию - английская
set iminsert=0
" Раскладка по умолчанию в строке поиска
set imsearch=0

" Просмотр нетекстовых файлов в Vim -->
    au BufReadPost *.pdf silent %!pdftotext -nopgbrk "%" - |fmt -csw78
    au BufReadPost *.doc silent %!antiword "%"
    au BufReadPost *.odt silent %!odt2txt "%"
" Просмотр нетекстовых файлов в Vim <--

