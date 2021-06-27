" hotkeys`

" Ускоренное передвижение по тексту
nmap <C-H> 5h
nmap <C-J> 5j
nmap <C-K> 5k
nmap <C-L> 5l

" Клавиши быстрого редактирования строки в режиме вставки
" и в режиме редактирования командной строки.
" -->
  "imap <C-H> <BS>
  imap <C-J> <Left>
  imap <C-K> <Right>
  imap <C-L> <Del>

  "cmap <C-H> <BS>
  cmap <C-J> <Left>
  cmap <C-K> <Right>
  cmap <C-L> <Del>
" <--

" NERDTree
:nmap <F2> :NERDTreeToggle<CR>

" Работа с табами
:map <A-,> <C-c>:tabprevious<CR>
:map <A-.> <C-c>:tabnext<CR>
:map <A-n> <C-c>:tabnew<CR>

    " Запуск/сокрытие плагина Winmanager
"    map <F1> :WMToggle<CR>
"    imap <F1> <Esc>:WMToggle<CR>
"    vmap <F1> <Esc>:WMToggle<CR>

    " Запуск/сокрытие плагина Tag List
"    map <F2> :TlistToggle<CR>
"    imap <F2> <Esc>:TlistToggle<CR>
"    vmap <F2> <Esc>:TlistToggle<CR>

" Очистить подсветку последнего найденного выражения
nmap <C-Space> :nohlsearch<CR>
imap <C-Space> <Esc>:nohlsearch<CR>
vmap <C-Space> <Esc>:nohlsearch<CR>gv

" :imap jj <Esc>
" :nnoremap mw <C-w>_
nnoremap ; :
" Вставить слово находящееся над курсором
inoremap <A-y> <Up><C-O>ye<Down><C-O>p 

" Переключение раскладок и индикация выбранной
" в данный момент раскладки.
" -->
  " Переключение раскладок будет производиться по <C-F>
  "
  " При английской раскладке статусная строка текущего окна будет синего
  " цвета, а при русской - зеленого.

  function MyKeyMapHighlight()
    if &iminsert == 0
      " g:colors_name определяется в цветовой теме challenger_deep
      if (exists("g:colors_name"))
        hi StatusLine ctermfg=Blue guifg=Blue
      else
        hi StatusLine ctermfg=DarkBlue guifg=DarkBlue
      endif
    else
      hi StatusLine ctermfg=DarkGreen guifg=DarkGreen
    endif
  endfunction

  " Вызываем функцию, чтобы она установила цвета при запуске Vim'a
  call MyKeyMapHighlight()

  " При изменении активного окна будет выполняться обновление
  " индикации текущей раскладки
  au WinEnter * :call MyKeyMapHighlight()

  cmap <silent> <C-F> <C-^>
  imap <silent> <C-F> <C-^>X<Esc>:call MyKeyMapHighlight()<CR>a<C-H>
  nmap <silent> <C-F> a<C-^><Esc>:call MyKeyMapHighlight()<CR>
  vmap <silent> <C-F> <Esc>a<C-^><Esc>:call MyKeyMapHighlight()<CR>gv
" <--

