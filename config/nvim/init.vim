" Author: Elias Müller
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Plug:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'majutsushi/tagbar'
Plug 'kien/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'suan/vim-instant-markdown'

" Completion:
"Plug 'Valloric/YouCompleteMe'
"Plug 'Shougo/deoplete.nvim'

" Notebook:
Plug 'bfredl/nvim-ipy'

" Autoclosing:
"Plug 'jiangmiao/auto-pairs' # Maybe check out in the future.
Plug 'Raimondi/delimitMate'

" Syntax:
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'vim-perl/vim-perl', { 'for': 'perl', 'do': 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny' }
Plug 'JuliaLang/julia-vim'

" LaTeX:

" Javascript:
"Plug 'othree/javascript-libraries-syntax.vim'
"Plug 'jelera/vim-javascript-syntax'
"Plug 'marijnh/tern_for_vim'
"Plug 'pangloss/vim-javascript'
"Plug 'vim-scripts/JavaScript-Indent'

" Formatting:
Plug 'junegunn/vim-easy-align'

" Colorschemes:
Plug 'scwood/vim-hybrid'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'mkarmona/colorsbox'
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'vim-scripts/ScrollColors'
Plug 'rakr/vim-two-firewatch'

" TOTRY List:
"Plug 'scrooloose/syntastic'
"Plug 'tpope/vim-unimpaired'
"Plug 'Townk/vim-autoclose'
"Plug 'Raimondi/delimitMate'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VisualStyles:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
colo hybrid
let g:enable_bold_font = 1 " from hyrid-material
let g:airline_theme = "hybrid"


" Formatting
set linespace=2

set number     " show line numbers
set cursorline " highlights cursor line

" Remove scrollbars
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=T
set guioptions-=m

" Resize vim when window size changes
au VimResized * exe "normal! \<c-w>="


if has ('gui_running')
   set guicursor+=a:blinkon0        " disable cursor blinking
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" key mappings
"nmap <C-]> :YcmCompleter GoTo<CR> " doesn't work as good as ctags
"let g:ycm_collect_identifiers_from_tags_files = 1

" use Eclim for omnicompletion
"let g:EclimCompletionMethod = 'omnifunc'
"map <F8> :YcmDiags<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Deoplete:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" always display
set laststatus=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctags:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" change working directory to the one of the current file
map <F9> :silent !ctags -R -f ./.tags<CR>
set tags=./.tags,.tags;$HOME


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nerdtree:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nerdtree at start
"autocmd VimEnter * NERDTree

"map <F3> :NERDTreeToggle<CR>
let NERDTreeChDirMode = 2
let NERDTreeDirArrows = 0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" JavaScriptSyntax:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:used_javascript_libs = 'jquery, underscore, backbone, requirejs, nodejs'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" working directory
let g:ctrlp_working_path_mode = 'r'
map <F5> :CtrlPClearCache<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar at start
"autocmd VimEnter * TagbarToggle

map <F4> :TagbarToggle<CR>
let g:tagbar_width = 35


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VimEasyAlign:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Formatting:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spacing:

set tabstop=4
" indentation width
set shiftwidth=4
" tabs inserts space characters (real tab character: <C-V><Tab>)
set expandtab
" specific to filetypes
autocmd FileType jade setlocal shiftwidth=2 tabstop=2
autocmd FileType md setlocal shiftwidth=2 tabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2

" reselect pasted stuff
nnoremap <leader>V V']

" breaks and line wrapping
set wrap
set linebreak
set showbreak=\ ->\ 
set cpo+=n
"set textwidth=80

" visual feedback for line width
let &colorcolumn="81"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Navigation:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" move to begin/end of line
"nnoremap L $
"nnoremap H ^

" easier moving arround splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" move down/up naturally even in wrapped Lines
"nnoremap j gj
"nnoremap k gk


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File Management:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autosave files when leaving window
"au FocusLost * :wa


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ignorecase
set smartcase

set hlsearch
set showmatch
set nowrapscan
set incsearch


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Clipboard:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set clipboard+=unnamedplus


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ','
"set noswapfile TODO: Use plugin that handles .swp files elegantly

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" disable Error Bell
autocmd! GUIEnter * set vb t_vb=

" Timestamp
nmap <F3> i<C-R>=strftime("%Y-%m-%d %H:%M")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %H:%M")<CR>

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
