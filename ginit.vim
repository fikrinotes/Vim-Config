colorscheme nord

helptags ALL
set ai
set smartindent
let g:airline_powerline_fonts = 1
:GuiFont Hack\ Nerd\ Font\ Mono:h7
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
set termguicolors
set lines=30 columns=125

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
nnoremap <F10> :!py %<CR>



function Terminal()
	:split
	:wincmd w
	:terminal
	:norm i
endfunction 

nnoremap  Term :call Terminal()
tnoremap <Esc> <C-\><C-n>
nnoremap Py :cd d:\Programming\Python
nnoremap Pas :cd d:\Programming\Pascal
nnoremap Java :cd d:Programming\Java
nnoremap Home :cd d:\Programming
nnoremap config :e C:\Users\HP\AppData\Local\nvim\init.vim
nnoremap ) "*y
nnoremap ( "*p
vnoremap ) "*y
vnoremap ( "*p
set encoding=UTF-8



call plug#begin('E:\App\Neovim\bin')

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors

set encoding=UTF-8

call plug#end()

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap Tree :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

nmap <F8> :TagbarToggle<CR>

:set completeopt-=preview " For No Previews


let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" --- Just Some Notes ---
" :PlugClean :PlugInstall :UpdateRemotePlugins
"
" :CocInstall coc-python
" :CocInstall coc-clangd
" :CocInstall coc-snippets
" :CocCommand snippets.edit... FOR EACH FILE TYPE

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

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

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <C-r> coc#refresh()
else
  inoremap <silent><expr> <C-@> coc#refresh()
endif

inoremap <expr> <CR> pumvisible() ? '<C-s>' : '<CR>'
