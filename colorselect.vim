" Подбор цвета вручную
" 

" select highlight group
let g:highlight_group="Folded"

" enter initial colors
let g:my_ctermfg=232
let g:my_ctermbg=141

function ChangeColor(fg, bg)
  let g:my_ctermfg=g:my_ctermfg + a:fg
  let g:my_ctermbg=g:my_ctermbg + a:bg
  if g:my_ctermfg<0
    let g:my_ctermfg=0
  endif
  if g:my_ctermfg>255
    let g:my_ctermfg=255
  endif
  if g:my_ctermbg<0
    let g:my_ctermbg=0
  endif
  if g:my_ctermbg>255
    let g:my_ctermbg=255
  endif
  execute "highlight" g:highlight_group "ctermfg=" . g:my_ctermfg "ctermbg=" . g:my_ctermbg
  echo "ctermfg=" . g:my_ctermfg . " ctermbg=" . g:my_ctermbg

endfunction

" change foreground
nmap .m :call ChangeColor(10,0)<CR>
nmap ,m :call ChangeColor(-10,0)<CR>
nmap .n :call ChangeColor(5,0)<CR>
nmap ,n :call ChangeColor(-5,0)<CR>
nmap .b :call ChangeColor(1,0)<CR>
nmap ,b :call ChangeColor(-1,0)<CR>

" change background
nmap >M :call ChangeColor(0,10)<CR>
nmap <M :call ChangeColor(0,-10)<CR>
nmap >N :call ChangeColor(0,5)<CR>
nmap <N :call ChangeColor(0,-5)<CR>
nmap >B :call ChangeColor(0,1)<CR>
nmap <B :call ChangeColor(0,-1)<CR>

