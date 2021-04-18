" let mapleader='\'

" Build mappings
map <F9> :wall \| make<Cr><Cr>
map <F8> :cn<Cr>zvzz:cc<Cr>
map <F7> :cp<Cr>zvzz:cc<Cr>
map <A-q> :cclose<CR>

" When using \b on normal mode, it will compile the
" project
nmap <LEADER>b <F9>

" Close the QuickFix window just with the q
" au FileType qf nnoremap <buffer> <A-q> :cclose<CR>

" After compiling, open the QuickFix window if there
" is any error
au QuickFixCmdPost make call OpenQuickFixBuffer()

" Opens/Closes the quickfix window depending 
" if the error list is empty or not
function! OpenQuickFixBuffer()
  let qflist = getqflist()
  if empty(qflist)
    cclose
  else
    copen
  endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

au FileType haskell call QuickFixHaskell()

" This will set the variables that QuickFix needs
" in order to compile, if you are on a project that 
" has a cabal file, use "cabal build", otherwise
" use "ghc --make" on the current file
function! QuickFixHaskell()
  ino <buffer> -. ->
  ino <buffer> ,- <-
  if filereadable('./package.yaml')
    set makeprg=stack\ build
  else
    set makeprg=stack\ ghc\ %<
  endif
  " Previous format given by Martin Norbäck 
  "setl errorformat+=%A%f:%l:\ %m,%A%f:%l:,%C%\\s%m,%Z
  
  " New format taken from haskellmode.vim
  setl errorformat=
                   \%-Z\ %#,
                   \%W%f:%l:%c:\ Warning:\ %m,
                   \%E%f:%l:%c:\ %m,
                   \%E%>%f:%l:%c:,
                   \%+C\ \ %#%m,
                   \%W%>%f:%l:%c:,
                   \%+C\ \ %#%tarning:\ %m,
endfunction
