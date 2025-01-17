"r 
" settings
" 
set t_Co=256
set expandtab
set hlsearch
set incsearch
set smartcase
set tw=0
set encoding=utf-8
set hidden
set updatetime=100
set shortmess+=c
set backspace=indent,eol,start
set ruler
set title
set nocompatible
set modeline
set modelines=6
set belloff=all
set nrformats=
set wildmenu
set history=200
set foldlevel=99
set laststatus=0
set autochdir
set textwidth=500
set conceallevel=0
set jumpoptions=stack
syntax on
autocmd FileType json set conceallevel=0
" set tabstop=2
" set softtabstop=2
" set shiftwidth=2
" set autoindent
" set indentexpr=
" set foldmethod=indent

" 
" colorscheme
" 
nnoremap <leader><leader>n :colorscheme habamax<CR>
nnoremap <leader><leader>d :colorscheme delek<CR>
colorscheme habamax

set cursorline
set cursorlineopt=number
autocmd ColorScheme * highlight CursorLineNr cterm=bold term=bold gui=bold
highlight LineNr ctermfg=238
:set number
:augroup numbertoggle
:   autocmd!
:   autocmd BufEnter, FocusGained, InsertLeave, WinEnter * if &nu && mode() != "i" | set rnu | endif
:   autocmd BufLeave, FocusLost, InsertEnter, WinLeave * if &nu | set nornu | endif
:augroup END
highlight CursorLineNr ctermfg=179

" 
" keymapping
" 
map J 5j
map K 5k
nnoremap S :w<CR>
nnoremap s <nop>
nnoremap Q :q<CR>
nnoremap <leader>q :q!<CR>
nnoremap sj :set splitbelow<CR>:split<CR>
nnoremap sk :set nosplitbelow<CR>:split<CR>
nnoremap sh :set nosplitright<CR>:vsplit<CR>
nnoremap sl :set splitright<CR>:vsplit<CR>
tnoremap <ESC><ESC> <C-\><C-N>
map <down> :res +5<CR>
map <up> :res -5<CR>
map <right> :vertical resize -5<CR>
map <left> :vertical resize +5<CR>
nnoremap <leader>R :source ~/.vimrc<CR>
nnoremap [w :execute 'move -1-'. v:count1<CR>
nnoremap ]w :execute 'move +'. v:count1<CR>
vmap <leader>S y/<C-R>"<CR>
nnoremap <leader>e :set spell<CR>
nnoremap <leader>E :set nospell<CR>
nnoremap <leader>I :<C-u>PlugInstall<CR>
nnoremap M :Lexplore<CR><C-w>l<CR>
inoremap <C-e> <C-k>
nnoremap <leader>md :h digraph-table<CR>
cnoremap <expr> %% getcmdtype()==':'?expand('%:h').'/':'%%'

" 
" macros
" 
let @g="a<br /> \<ESC>"
let @r="i<br /> \<CR>\<ESC>"
let @c="```placeholder```\<ESC>bi\<CR>\<CR>\<ESC>kkel"

" 
" patch
" 
if has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

" 
" plugin
" 
call plug#begin()
   " [jiangmiao/auto-pairs]
   Plug 'jiangmiao/auto-pairs'

   " [ryanoasis/vim-devicons]
   Plug 'ryanoasis/vim-devicons'

   " [Yggdroot/indentLine]
   Plug 'Yggdroot/indentLine'
   let g:indentLine_color_term=102
   let g:markdown_syntax_conceal=0
   let g:indentLine_char_list=['|']
   nnoremap <leader>il :<C-u>IndentLinesToggle<CR>

   " [mhinz/vim-signify]
   Plug 'mhinz/vim-signify'
   highlight SignifySignAdd ctermfg=green cterm=NONE
   highlight SignifySignDelete ctermfg=red cterm=NONE
   highlight SignifySignChange ctermfg=yellow cterm=NONE
   nnoremap <leader>gj <Plug>(signify-next-hunk)
   nnoremap <leader>gk <Plug>(signify-prev-hunk)
  
   " [prabirshrestha/asyncomplete.vim]
   Plug 'prabirshrestha/asyncomplete.vim'
   inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
   inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
   nnoremap <expr> <CR> pumvisible() ? asyncomplete#close_popup()

   if has('conceal')
     set conceallevel=2 concealcursor=niv
   endif

call plug#end()
