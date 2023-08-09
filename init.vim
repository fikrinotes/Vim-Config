helptags ALL
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
nnoremap <F10> :!py %<CR>

" terminal


function Terminal()
	:split
	:wincmd w
	:terminal
	:norm i
endfunction 

nnoremap Te :call Terminal()   
tnoremap <Esc> <C-\><C-n>
nnoremap Py :cd d:\Programming\Python
nnoremap Pas :cd d:\Programming\Pascal
nnoremap Java :cd d:Programming\Java
nnoremap Home :cd d:\Programming
nnoremap config :e C:\Users\HP\AppData\Local\nvim\init.vim
nnoremap <C-r> :source %<CR>
nnoremap ) "*y
nnoremap ( "*p
vnoremap ) "*y
vnoremap ( "*p
set encoding=UTF-8



call plug#begin('E:\App\Neovim\bin')

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors

set encoding=UTF-8

call plug#end()

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap Tree :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

nmap <F8> :TagbarToggle<CR>

:set completeopt-=preview " For No Previews

:colorscheme materialbox

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

"VIM backup file directory :
" tell vim to keep a backup file
set backup

" tell vim where to put its backup files
set backupdir=D:/Programming/metadata-folder/backups,.
set directory=D:/Programming/metadata-folder/swaps,.
set undodir=D:/Programming/metadata-folder/undos,.


" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> (enter key) to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
" coc#pum#confirm() is a command to confirm a selected menu it coc menu to
" display on the code
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

