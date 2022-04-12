"====================
"=== Const String ===
"====================
let g:DIR_VIMPLUG = "~/.vim/autoload/plug.vim"
let g:DIR_PLUGINS = "~/.vim/plugged"
let g:URL_VIMPLUG = "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
let g:CMD_INSTALL_VIMPLUG = "!curl -sfLo ". DIR_VIMPLUG ." --create-dirs " . URL_VIMPLUG
let g:CMD_INSTALL_NODEJS = "!curl -sL install-node.vercel.app/lts | bash /dev/stdin -f >> /dev/null"

"===========================
"=== Initialize VIM-PLUG ===
"===========================
if ((system("node -v")[1:] + 0) < 16)
  :execute CMD_INSTALL_NODEJS
endif
if empty(glob(DIR_VIMPLUG))
  :execute CMD_INSTALL_VIMPLUG
  autocmd VimEnter $MYVIMRC PlugInstall --sync | q
  autocmd VimEnter $MYVIMRC source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
  Plug 'morhetz/gruvbox'
  Plug 'vim-airline/vim-airline'
  Plug 'preservim/nerdtree'
  Plug 'Yggdroot/indentLine'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

autocmd VimEnter $MYVIMRC PlugInstall --sync | q
autocmd VimEnter $MYVIMRC source $MYVIMRC
"====================
"=== Basic Editor ===
"====================
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

let &t_ut=''
set nobackup
set nowritebackup
set encoding=utf-8
set hidden
set cmdheight=1
"set list
"set listchars=tab:➪\ 
"set listchars+=trail:·,
"set listchars+=eol:⤶
set scrolloff=5
set textwidth=0
set backspace=indent,eol,start
"let &t_SI="\<Esc>]50;CursorShape=1\x7"
"let &t_SR="\<Esc>]50;CursorShape=2\x7"
"let &t_EI="\<Esc>]50;CursorShape=0\x7"
set autochdir
set number
set relativenumber
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set ignorecase
set smartcase
set hlsearch
set incsearch
exec 'nohlsearch'
set cursorline
"set cursorcolumn
set notimeout
set wrap
set mouse=a
set clipboard=unnamed
filetype plugin on

"===================
"=== Colorscheme ===
"===================
syntax enable
syntax on
set t_Co=256
set background=dark
try
  colorscheme gruvbox
catch
endtry

let g:airline#extensions#tabline#enabled = 1
"let g:airline_powerline_fonts = 1
"let vim_markdown_preview_github=1

"================
"=== Bind Key ===
"================
let mapleader=' '

" Tab Manage
nnoremap tj :tabnext<CR>
nnoremap tk :tabprevious<CR>
nnoremap tn :tabnew<CR>
nnoremap tc :tabclose<CR>

" Split Screen
nnoremap s <nop>
nnoremap s= :split<CR>
nnoremap s" :vsplit<CR>
nnoremap sc <C-w>c

" Focus Switch 
nnoremap Fh <C-w>h
nnoremap Fj <C-w>j
nnoremap Fk <C-w>k
nnoremap Fl <C-w>l

" Search Enhance
nnoremap n nzz
nnoremap N Nzz
nnoremap <leader><CR> :nohlsearch<CR>

" NERDComment

" Undo tree
nnoremap <leader>z :UndotreeToggle<CR>

" NERDTree Toggle
nnoremap <leader>e :NERDTreeToggle<CR>

nnoremap <leader>mc :set nonumber norelativenumber<CR>:set mouse=<CR>
nnoremap <leader>mn :set number relativenumber<CR>:set mouse=a<CR>

nnoremap R <nop>
nnoremap R :source $MYVIMRC<CR>
nnoremap S :w<CR>
nnoremap Q :q<CR>
nnoremap W :wq<CR>

"================
"=== Coc.nvim ===
"================
let g:coc_disable_startup_warning = 1
let g:coc_global_extensions = [
      \ 'coc-json',
      \ 'coc-css',
      \ 'coc-html',
      \ 'coc-vimlsp',
      \ 'coc-cmake',
      \ 'coc-highlight',
      \ 'coc-pyright'
      \ ]

"set signcolumn=number
"=== tab shift-tab enter to select ===
inoremap <silent><expr> <TAB> 
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><s-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.')-1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction
if exists('*complete_info')
  inoremap <silent><expr> <CR> complete_info(['selected'])['selected'] != -1 ? "\<C-y>" : "\<C-g>u\<CR>"
endif

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if(index(['vim', 'help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
"=====================================

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 1
