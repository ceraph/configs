" Author: Elias Müller
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Plug:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.config/nvim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'suan/vim-instant-markdown'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'wincent/terminus'

" Completion:
"Plug 'Valloric/YouCompleteMe'
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"
" Generates a lot of default code (classes, licenses etc.) for many languages.
Plug 'SirVer/ultisnips' " Snippet engine.
Plug 'honza/vim-snippets' " Actual snippets.

" Notebook:
Plug 'bfredl/nvim-ipy'
Plug 'vimwiki/vimwiki'

" Autoclosing:
Plug 'jiangmiao/auto-pairs' " Maybe check out in the future.
"Plug 'Raimondi/delimitMate'

" Syntax:
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'sheerun/vim-polyglot'
Plug 'PotatoesMaster/i3-vim-syntax'
"Plug 'JuliaLang/julia-vim'

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
Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/base16-vim'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'lifepillar/vim-solarized8'
Plug 'mkarmona/colorsbox'
Plug 'morhetz/gruvbox'
Plug 'morhetz/gruvbox'
Plug 'scwood/vim-hybrid'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/mayansmoke'
Plug 'vim-scripts/pyte'

" TOTRY List:
"Plug 'scrooloose/syntastic'
"Plug 'tpope/vim-unimpaired'
"Plug 'Townk/vim-autoclose'
"Plug 'Raimondi/delimitMate'

call plug#end()

let mapleader = ','
nnoremap <c-s> :w<cr>
" Colemak layout
"noremap n j
"noremap e k
"noremap i l

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VisualStyles:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
color base16-gruvbox-dark-hard


" Formatting
set linespace=2

"set number " Show line numbers.
set cursorline " highlights cursor line
" Cursor. Insert mode: bar; Else: Block.
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor

" Resize vim when window size changes
au VimResized * exe "normal! \<c-w>="


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fzf:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:fzf_history_dir = '~/.local/share/fzf-history'
nmap <C-p> :FZF<CR>

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

nnoremap ; :Buffer<CR>
nnoremap <leader>t :Tags<CR>

function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" key mappings
"nmap <C-]> :YcmCompleter GoTo<CR> " doesn't work well (uses jump stack)
"let g:ycm_collect_identifiers_from_tags_files = 1

" use Eclim for omnicompletion
"let g:EclimCompletionMethod = 'omnifunc'
map <F8> :YcmDiags<CR>
let g:ycm_global_ycm_extra_conf = '~/.config/ycm_extra_conf.py'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Deoplete:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lightline:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set noshowmode " Plugin shows it already.
let g:lightline = {
	\ 'colorscheme': 'jellybeans',
	\ 'active': {
	\ 	'left': [ [ 'mode', 'paste' ],
	\ 	          [ 'readonly', 'filename' ] ],
	\ 	'right': [ [ 'lineinfo' ],
	\	           [ 'percent' ], ],
	\ },
	\ 'component_function': {
	\ 	'filename': 'LightlineFilename',
	\ },
	\ }

function! LightlineFilename()
	let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
	let modified = &modified ? ' +' : ''
	return filename . modified
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CPP Enhance Syntax Highlighting:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:cpp_member_variable_highlight = 1
"let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_class_scope_highlight = 1
let g:cpp_class_decl_highlight = 1
let c_no_curly_error = 1

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
set nowrap
"set linebreak
"set showbreak=\ ->\ 
set cpo+=n
set textwidth=80
set fo=croq

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

nnoremap <silent> <c-left> :call TmuxMove('h')<cr>
nnoremap <silent> <c-down> :call TmuxMove('j')<cr>
nnoremap <silent> <c-up> :call TmuxMove('k')<cr>
nnoremap <silent> <c-right> :call TmuxMove('l')<cr>

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
" Misc:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

" Defined in 'autoload/bclose.vim'. Closes buffer without deleting window.
nmap <C-W>! <Plug>Kwbd 

" Highlight background of columns that are > textwidth.
execute "set colorcolumn=" . join(map(range(1,259), '"+" . v:val'), ',')
highlight ColorColumn ctermbg=235 guibg=#1B1E1F
