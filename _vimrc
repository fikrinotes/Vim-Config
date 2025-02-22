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

call plug#begin()
Plug 'ryanoasis/vim-devicons'
Plug 'uiiaoo/java-syntax.vim'
Plug 'vim-airline/vim-airline'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'vim-python/python-syntax'
Plug 'tpope/vim-surround'
Plug 'github/copilot.vim'
call plug#end()


" packadd! dracula
syntax enable

let g:material_style='palenight'
set background=dark
set termguicolors
if has('gui_running')
    " hiding the toolbar :
    set guioptions-=T
    " hiding scrollbar :
    set guioptions-=r
    set guioptions-=L 
    set lines=30 columns=110

else
    set termguicolors
endif

let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"

colorscheme material
set splitbelow
helptags C:\Users\HP\vimfiles\plugged
set ai
set smartindent
let g:airline_powerline_fonts = 1
set guifont=Hack\ Nerd\ Font\ Mono:h9
syntax on
set belloff=all
set mouse=a
set relativenumber
set number
set nowrap
set ignorecase
set smarttab
set path+=**
set wildmenu
set noshowmode
filetype plugin on
set omnifunc=syntaxcomplete#Complete
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags


"pydiction
let g:pydiction_location = 'E:/App/Vim/vimfiles/pack/vendor/start/complete-dict'
let g:pydiction_menu_height = 4

" python highlighting"

let g:python_highlight_all = 1

"template :
nnoremap Html5 :r D:\Programming\Template\template.html
nnoremap Javaclass :r D:\Programming\Template\template.java



inoremap <F9> <c-y>,
inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap [ []<Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i
tnoremap <Esc><Esc> <c-w>N
nnoremap <F10> :!python %<CR>

"for emmet:
imap <c-e><c-e> <c-y>,
nnoremap Tree :NERDTree
nnoremap Dracula :colorscheme dracula
nnoremap Material :colorscheme material
nnoremap Everforest :colorscheme everforest
nnoremap Arch :colorscheme archery
nnoremap Py :cd d:\Programming\Python
nnoremap Pas :cd d:\Programming\Pascal
nnoremap Java :cd d:Programming\Java
nnoremap Home :cd d:\Programming
nnoremap config :o e:\App\Vim\_vimrc
nnoremap ) "*y
nnoremap ( "*p
vnoremap ) "*y
vnoremap ( "*p
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
set encoding=UTF-8


let g:airline_section_b= '%{strftime("%c")}'
let g:airline_section_y= 'BN: %{bufnr("%")}'
let g:airline#extensions#tabline#enabled = 1
set t_Co=256

"VIM backup file directory :
" tell vim to keep a backup file
set backup

" tell vim where to put its backup files
set backupdir=D:/Programming/metadata-folder/backups,.
set directory=D:/Programming/metadata-folder/swaps,.
set undodir=D:/Programming/metadata-folder/undos,.

if has('terminal')
    set termguicolors
    highlight Terminal guibg=bg guifg=fg
endif
