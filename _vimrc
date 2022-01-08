" Vim with all enhancements
source $VIMRUNTIME/vimrc_example.vim

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

packadd! dracula
syntax enable
if has('gui_running')
    colorscheme material
    let g:airline_powerline_fonts = 1

else
    colorscheme archery
    set termguicolors
endif

helptags ALL
set ai
set guifont=Source\ Code\ Pro\ For\ Powerline:h10
syntax on
set belloff=all
set noundofile
set relativenumber
set number
set background=dark
set nobackup
set path+=**
set wildmenu
set noshowmode
set nowrap
filetype plugin on
set omnifunc=syntaxcomplete#Complete
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd BufNewFile *.html r D:\Programming\template.html
nnoremap html5 :r D:\Programming\template.html
inoremap <F9> <c-y>,
inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap [ []<Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i
tnoremap <Esc><Esc> <c-w>N
nnoremap <F10> :! python %<CR> 

"for emmet:
imap <c-e><c-e> <c-y>,
nnoremap tree :NERDTree
nnoremap dracula :colorscheme dracula
nnoremap material :colorscheme material
nnoremap py :cd d:\Programming\Python
nnoremap home :cd d:\Programming
nnoremap config :cd e:\App\Vim
nnoremap ) "*y
nnoremap ( "*p
vnoremap ) "*y
vnoremap ( "*p
set encoding=UTF-8


let g:python_highlight_all=1
let g:airline_section_b= '%{strftime("%c")}'
let g:airline_section_y= 'BN: %{bufnr("%")}'
let g:airline#extensions#tabline#enabled = 1
set t_Co=256
set ls=2
