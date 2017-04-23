" Author: Elias Müller
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Plug:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'suan/vim-instant-markdown'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'brookhong/cscope.vim'

" Completion:
Plug 'Valloric/YouCompleteMe'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Notebook:
Plug 'bfredl/nvim-ipy'
Plug 'vimwiki/vimwiki'

" Autoclosing:
"Plug 'jiangmiao/auto-pairs' " Maybe check out in the future.
Plug 'Raimondi/delimitMate'

" Syntax:
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'vim-perl/vim-perl', { 'for': 'perl', 'do': 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny' }
Plug 'JuliaLang/julia-vim'
Plug 'octol/vim-cpp-enhanced-highlight'
"Plug 'arakashic/chromatica.nvim' "Not ready yet.

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
Plug 'lifepillar/vim-solarized8'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'mkarmona/colorsbox'
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'


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
set termguicolors
color hybrid_material
set bg=dark
let g:enable_bold_font = 1 " from hyrid-material
let g:airline_theme = "hybrid"


" Formatting
set linespace=2

set number     " show line numbers
set cursorline " highlights cursor line

" Resize vim when window size changes
au VimResized * exe "normal! \<c-w>="


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:fzf_history_dir = '~/.local/share/fzf-history'
nmap <C-p> :FZF<CR>

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" key mappings
"nmap <C-]> :YcmCompleter GoTo<CR> " doesn't work well (uses jump stack)
"let g:ycm_collect_identifiers_from_tags_files = 1

" use Eclim for omnicompletion
"let g:EclimCompletionMethod = 'omnifunc'
map <F8> :YcmDiags<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Deoplete:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:deoplete#enable_at_startup = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CPP Enhance Syntax Highlighting:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:cpp_concepts_highlight = 1
let g:cpp_class_scope_highlight = 1
let c_no_curly_error = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" always display
set laststatus=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctags:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" change working directory to the one of the current file
map <F9> :silent !ctags -R --c++-kinds=+p --fields=+iaS --extra=+q -f ./.tags . <CR>
set tags=./.tags,.tags;$HOME

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" JavaScriptSyntax:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:used_javascript_libs = 'jquery, underscore, backbone, requirejs, nodejs'

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

set tabstop=8
set shiftwidth=8
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

function! TmuxMove(direction)
        let wnr = winnr()
        silent! execute 'wincmd ' . a:direction
        " If the winnr is still the same after we moved, it is the last pane
        if wnr == winnr()
                call system('tmux select-pane -' . tr(a:direction, 'phjkl', 'lLDUR'))
        end
endfunction

nnoremap <silent> <c-h> :call TmuxMove('h')<cr>
nnoremap <silent> <c-j> :call TmuxMove('j')<cr>
nnoremap <silent> <c-k> :call TmuxMove('k')<cr>
nnoremap <silent> <c-l> :call TmuxMove('l')<cr>

" easier moving arround splits
"nnoremap <C-h> <C-w>h
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l

" Invert vims default split creation.
set splitbelow
set splitright

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
" Cscope:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>fa :call CscopeFindInteractive(expand('<cword>'))<CR>
nnoremap <leader>l :call ToggleLocationList()<CR>

" s: Find this C symbol
nnoremap  <leader>fs :call CscopeFind('s', expand('<cword>'))<CR>
" g: Find this definition
nnoremap  <leader>fg :call CscopeFind('g', expand('<cword>'))<CR>
" d: Find functions called by this function
nnoremap  <leader>fd :call CscopeFind('d', expand('<cword>'))<CR>
" c: Find functions calling this function
nnoremap  <leader>fc :call CscopeFind('c', expand('<cword>'))<CR>
" t: Find this text string
nnoremap  <leader>ft :call CscopeFind('t', expand('<cword>'))<CR>
" e: Find this egrep pattern
nnoremap  <leader>fe :call CscopeFind('e', expand('<cword>'))<CR>
" f: Find this file
nnoremap  <leader>ff :call CscopeFind('f', expand('<cword>'))<CR>
" i: Find files #including this file
nnoremap  <leader>fi :call CscopeFind('i', expand('<cword>'))<CR>


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

"Search for .vim file (local config).
let b:thisdir=expand("%:p:h")
let b:vim=b:thisdir."/.vim"
if (filereadable(b:vim))
    execute "source ".b:vim
endif

"Close XML tags
imap <silent> <C-c> </<C-X><C-O><C-X>
