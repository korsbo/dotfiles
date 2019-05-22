let g:mapleader = "\<Space>"
let g:python3_host_prog = "/home/Niklas/programs/anaconda3/envs/py37/bin/python"



set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.local/share/nvim/plugged')
"=============================================================================="
"================================  Navigation  ================================"
"=============================================================================="

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    nmap <leader>n :NERDTreeToggle<CR>
    let NERDTreeMapOpenInTab='\t'
    let NERDTreeQuitOnOpen = 1
    let NERDTreeAutoDeleteBuffer = 1
    let NERDTreeMinimalUI = 1
    let NERDTreeDirArrows = 1
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

set rtp+=~/.fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" {{{
    source ~/.config/nvim/fzf_config.vim
" }}}
Plug 'mileszs/ack.vim'
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
nmap <leader>a :Ack<space> 

"=============================================================================="
"=================================  Editing  =================================="
"=============================================================================="

Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
" {{{
  nnoremap <leader>c :Commentary 
  autocmd FileType julia setlocal commentstring=#\ %s
" }}}
Plug 'godlygeek/tabular'
Plug 'FooSoft/vim-argwrap'
autocmd FileType julia let b:argwrap_tail_comma=1
nnoremap <silent> <leader>e :ArgWrap<CR>

"=============================================================================="
"================================  Appearance  ================================"
"=============================================================================="
Plug 'nathanaelkane/vim-indent-guides'
" Status bar 
Plug 'vim-airline/vim-airline'

"=============================================================================="
"=======================  Asynchronous code completion  ======================="
"=============================================================================="
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'Shougo/deoplete.nvim'
  Plug 'deoplete-plugins/deoplete-zsh'
  Plug 'deoplete-plugins/deoplete-jedi'
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
" {{{
    let g:deoplete#enable_at_startup = 1
" }}}

Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ }
" {{{
    let g:LanguageClient_autoStart = 1
    let g:LanguageClient_serverCommands = {
        \   'julia': ['julia', '--startup-file=no', '--history-file=no', '-e', '
        \       using LanguageServer;
        \       using Pkg;
        \       import StaticLint;
        \       import SymbolServer;
        \       env_path = dirname(Pkg.Types.Context().env.project_file);
        \       debug = false; 
        \       
        \       server = LanguageServer.LanguageServerInstance(stdin, stdout, debug, env_path, "", Dict());
        \       server.runlinter = true;
        \       run(server);
        \   ']
        \ }

    nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
    nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
    nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
" }}}


"=============================================================================="
"=============================  Terminal support  ============================="
"=============================================================================="
Plug 'kassio/neoterm' 
" {{{
    " - *c*lear, *c*trl-c, workspace *c*ommand
    nnoremap <silent> <leader>cl :call neoterm#clear()<cr>
    nnoremap <silent> <leader>cc :call neoterm#kill()<cr>
    nnoremap <silent> <leader>cw :call neoterm#do("workspace()")<cr>
    " - show *j*ulia @doc, show(info)
    " nnoremap <silent> <localleader>jd :Texec ("@doc " . expand("<cword>"))<cr>
    " nnoremap <silent> <localleader>je :call neoterm#do("@edit " . expand("<cword>"))<cr>
    " nnoremap <silent> <localleader>ji :call neoterm#do(expand("<cword>"))<cr>
    " - send *a*ll, i.e. file
    nnoremap <silent> <leader>aa :w<cr>:T includet("%")<cr>
    nnoremap <silent> <leader>ae :w<cr>:TREPLSendFile<cr>
    " - send *p*aragraph (cursor location changes)
    nnoremap <silent> <leader>pp mavip:TREPLSendLine<cr><esc>`a
    nnoremap <silent> <leader>pd vip:TREPLSendLine<cr><esc>}
    " - send *s*election (cursor location changes)
    vnoremap <silent> <leader>ss :TREPLSendSelection<cr>
    vnoremap <silent> <leader>l :TREPLSendSelection<cr>
    vnoremap <silent> <leader>sd :TREPLSendSelection<cr>j
    vnoremap <silent> <leader>d :TREPLSendSelection<cr>j
    " - send *l*ine, optionally go *d*own
    nnoremap <silent> <leader>l :TREPLSendLine<cr>
    nnoremap <silent> <leader>d :TREPLSendLine<cr>j
    "
    "
    au TermOpen * tnoremap <Esc> <c-\><c-n>
    au FileType fzf silent! tunmap <Esc>
    tnoremap <C-k> <C-w><Up>
    tnoremap <C-l> <C-w><Right>
    tnoremap <C-t> <C-w><Down>
    tnoremap <C-h> <C-w><Left>
    "
    autocmd TermOpen <Buffer> setlocal scrolloff=0
    let g:neoterm_default_mod="botright"
    let g:neoterm_size=25
" }}}


"=============================================================================="
"=================================  Snippets  ================================="
"=============================================================================="

Plug 'SirVer/ultisnips'
    " make YCM compatible with UltiSnips (using supertab)
    " let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
    " let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
    " let g:SuperTabDefaultCompletionType = '<C-n>'

    " better key bindings for UltiSnipsExpandTrigger
    let g:UltiSnipsExpandTrigger = "<tab>"
    let g:UltiSnipsJumpForwardTrigger = "<tab>"
    let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

    " If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit="vertical"

    let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']


Plug 'honza/vim-snippets'

"=============================================================================="
"===================================  Git  ===================================="
"=============================================================================="
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

"=============================================================================="
"=============================  Language support  ============================="
"=============================================================================="
Plug 'JuliaLang/julia-vim'
" {{{
    let g:default_julia_version = '1.1'
    au VimEnter,BufRead,BufNewFile *.jl set filetype=julia
" }}}

Plug 'ivanov/vim-ipython'

Plug 'cmci/ImageJMacro_Highlighter'

Plug 'lervag/vimtex'
" {{{
    let g:vimtex_compiler_method = 'latexmk'
    let g:vimtex_compiler_progname = 'nvr'
    let g:vimtex_quickfix_mode=0
    set conceallevel=1
    let g:tex_conceal='abdmg'

    map <F2> :w<cr><leader>ll
    let g:vimtex_view_general_viewer = 'zathura'
    let g:vimtex_view_method= 'zathura'
    "let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
    let g:vimtex_view_general_options = '-s'
    "let g:vimtex_view_general_options_latexmk = '--unique'

    autocmd FileType tex silent! unmap <buffer> tse
    autocmd FileType tex silent! unmap <buffer> tsd
    autocmd FileType tex silent! unmap <buffer> tsD
    autocmd FileType tex silent! unmap <buffer> tsc

    autocmd FileType tex nnoremap <buffer> jse <Plug>(vimtex-env-toggle-star)
    autocmd FileType tex nnoremap <buffer> jsd <Plug>(vimtex-delim-toggle-modifier)
    autocmd FileType tex nnoremap <buffer> jsD <Plug>(vimtex-delim-toggle-modifier-reverse)
    autocmd FileType tex nnoremap <buffer> jsc <Plug>(vimtex-cmd-toggle-star)

    autocmd FileType tex silent! unmap <buffer> <leader>l 

    autocmd FileType tex nmap <buffer> <localleader>ll :w<CR><Plug>(vimtex-compile)
    autocmd FileType tex nnoremap <buffer> <localleader>lt :call vimtex#fzf#run()<cr>
    autocmd FileType tex setlocal textwidth=80

    autocmd FileType tex setlocal spell
    
    " Make C-l fix last spelling mistake while in insert mode.
    autocmd FileType tex inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
    autocmd FileType tex setlocal whichwrap=b,s,h,l,<,>


    let g:Tex_IgnoredWarnings = 
        \"Underfull\n".
        \"Overfull\n".
        \"specifier changed to\n".
        \"You have requested\n".
        \"Missing number, treated as zero.\n".
        \"There were undefined references\n".
        \"Citation %.%# undefined\n".
        \"Font Shape"
    let g:Tex_IgnoreLevel = 8
    let g:Tex_GotoError = 0


" }}}
Plug 'matze/vim-tex-fold'

Plug 'octol/vim-cpp-enhanced-highlight'
let g:cpp_class_scope_highlight = 1

"=============================================================================="
"===================================  Misc  ==================================="
"=============================================================================="

Plug 'thanthese/Tortoise-Typing'
Plug 'junegunn/goyo.vim'
function! ProseMode()
  call goyo#execute(0, [])
  setlocal spell noci nosi noai nolist noshowmode noshowcmd
  setlocal spelllang=en_gb
  setlocal complete+=s

  "set thesaurus+=/Users/sbrown/.vim/thesaurus/mthesaur.txt
  setlocal formatprg=par
  setlocal linebreak 
  setlocal autoread
  " colors solarized
endfunction

command! ProseMode call ProseMode()
nmap <leader>w :ProseMode<CR>


"
call plug#end()            " required
filetype plugin indent on    " required
filetype plugin on

call deoplete#enable()
call deoplete#custom#source('_',
    \ 'disabled_syntaxes', ['Comment', 'String'])
call deoplete#custom#option('sources', {
    \ 'julia': ['LanguageClient'],
    \})

call deoplete#custom#var('omni', 'input_patterns', {
            \ 'tex': g:vimtex#re#deoplete
            \})
"=====[ Enable Nmap command for documented mappings ]================
runtime bundle/plugin/documap.vim
runtime macros/matchit.vim

" ================ Appearance ==================
" set highligting when searching
set hls


syntax enable " Turn on syntax highlighting  
colorscheme monokai
colorscheme vorange " for some reason this one will not switch on without first
" changing to another colorscheme
set number
set hidden " Leave hidden buffers open  
set history=100 
set colorcolumn=80
set cursorline

command DoMatchParen

" Mute the background color of unfocused window panes.
hi ActiveWindow ctermbg=16 | hi InactiveWindow ctermbg=236
set winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow



"====[ Make tabs, trailing whitespace, and non-breaking spaces visible ]======
"exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
"set list

au BufRead,BufNewFile *.gnu set filetype=gnuplot

" ================ Navigation  ==================

set mouse=a

" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'
" let g:ctrlp_working_path_mode = 'a'

" make Y yank from cursor to end of line
nnoremap Y y$

" Quicker window navigation
nnoremap <c-t> <c-w><Down>
nnoremap <c-k> <c-w><Up>
nnoremap <c-h> <c-w><Left>
nnoremap <c-l> <c-w><Right>

nnoremap <C-/> :Commentary

" bring up command without pressing shift
" map ; :
"Nmap s [:] :
nmap s :
"noremap ;; ;

" Switch between tabs
nmap <leader>1 1gt
nmap <leader>2 2gt
nmap <leader>3 3gt
nmap <leader>4 4gt
nmap <leader>5 5gt
nmap <leader>6 6gt
nmap <leader>7 7gt
nmap <leader>8 8gt
nmap <leader>9 9gt

" Close a buffer without closing the window.
map <leader>q :b#|bd#

"map <Right> g<Right>
"map <Left> g<Left>
map <Up> g<Up>
map <Down> g<Down>

" ================ Editing  ==================
"
" Save me from my frequent but never ambiguous typos.
iabbrev teh the
iabbrev Teh The
iabbrev lenght length
iabbrev Lenght Length

"I'm sick of typing :%s/.../.../g
"Nmap S  [Shortcut for :s///g]  :%s//g<LEFT><LEFT>
nmap S   :%s//g<LEFT><LEFT>
vmap S                         :s//g<LEFT><LEFT>

"Nmap <expr> M  [Shortcut for :s/<last match>//g]  ':%s/' . @/ . '//g<LEFT><LEFT>'
nmap <expr> M ':%s/' . @/ . '//g<LEFT><LEFT>'
vmap <expr> M ':s/' . @/ . '//g<LEFT><LEFT>'


" Let Y in visual append clipboard rather than replace.
vnoremap <silent> Y <ESC>:silent let @y = @"<CR>gv"Yy:silent let @" = @y<CR>

" Create an in-line comment heading 
nnoremap <leader>h :center 80<cr>3hv0r#2A<space><esc>40A#<esc>d80<bar>YppVr#kk.

" Surround all =, +=, .*=, etc with a single space, unless they are in a
" # comment.
" nnoremap <leader>= mj:g/^[^#]/s/\(\w\)\s*\(\W*=\)\s*/\1 \2 /g<cr>:nohls<cr>`j
nnoremap <leader>= mj:g/^[^#]/s/\s*\([^a-zA-Z0-9)}\]]*=\)\s*/ \1 /g<cr>:nohls<cr>`j


" ================ Settings  ==================
set wildmenu
set wildmode=list:longest,full
set incsearch
set ignorecase
set smartcase
set infercase

set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftround
set expandtab
set smarttab

set scrolloff=5
set undolevels=5000
set clipboard=unnamed,unnamedplus
set lazyredraw
set hidden
set noswapfile
set virtualedit=onemore
set showcmd

command! W w
command! Q q



set shell=/usr/bin/zsh

" ================ Julia ==================
" LongDef, a not-really-functional prototype for replacing short form
" functions with long form ones.
" function! LongDef()
"     let line = getline(".")
"     let longform = substitute(line, '\(.*\)(\(.*\)).*=\s*\(.*\)', 'function \1(\2)\n    \3\rend\n', "")
"     call append(".", longform)
" endfun

" ================ LATEX ==================
" let g:tex_flavor = "latex"
" let g:Tex_DefaultTargetFormat="pdf"
" set grepprg=grep\ -nH\ $*



function! SentenceBreakOut()
    execute "normal! l("
    if col(".") != 1
        execute "normal! i\<cr>"
    end
    execute "normal! dis"
    let s = @"
    let s = substitute(s, "\n", " ", "g")
    let @" = s . "\n"
    execute "normal! P"
    execute "normal! =j"
endfunction
autocmd FileType tex nnoremap <buffer> <leader>s :call SentenceBreakOut()<cr>
" autocmd FileType tex nnoremap <buffer> <leader>s cis<cr><cr><cr><up><up><esc>pvis:s/\n/ /g<cr>:nohls<cr>


function! WordProcessorMode()
  setlocal noexpandtab 
  setlocal colorcolumn=0
  "map j gj
  "map k gk
  setlocal spell spelllang=en_gb
  "set thesaurus+=/Users/sbrown/.vim/thesaurus/mthesaur.txt
  set complete+=s
  set formatprg=par
  setlocal wrap 
  setlocal linebreak 
  set autoread
endfunction 
com! WP call WordProcessorMode()

" Reformat lines (getting the spacing correct) {{{
fun! TeX_fmt()
    if (getline(".") != "")
    let save_cursor = getpos(".")
        let op_wrapscan = &wrapscan
        set nowrapscan
        let par_begin = '^\(%D\)\=\s*\($\|\\begin\|\\end\|\\[\|\\]\|\\\(sub\)*section\>\|\\item\>\|\\NC\>\|\\blank\>\|\\noindent\>\)'
        let par_end   = '^\(%D\)\=\s*\($\|\\begin\|\\end\|\\[\|\\]\|\\place\|\\\(sub\)*section\>\|\\item\>\|\\NC\>\|\\blank\>\)'
    try
      exe '?'.par_begin.'?+'
    catch /E384/
      1
    endtry
        norm V
    try
      exe '/'.par_end.'/-'
    catch /E385/
      $
    endtry
    norm gq
        let &wrapscan = op_wrapscan
    call setpos('.', save_cursor) 
    endif
endfun
" }}}

" ================ Workman Keylayout ==================
inoremap <S-Space> _
function! Workman_minimal()
  " (t)ill -> (j)ump
  noremap j t
  noremap J T
  noremap t j
  noremap T J

  "onoremap j t
  "onoremap J T
  "onoremap t j
  "onoremap T J

  nnoremap t gj
  vnoremap t gj
  nnoremap k gk
  vnoremap k gk

  noremap <C-f> <C-d>
endfunction

function! Unmap_workman_minimal()
  silent! nunmap j
  silent! nunmap J
  silent! nunmap t
  silent! nunmap T
endfunction

function! Workman_home_row()
  "(O)pen line -> (L)ine
  nnoremap l o
  nnoremap o l
  nnoremap L O
  nnoremap O L
  "Search (N)ext -> (J)ump
  nnoremap j n
  nnoremap n j
  nnoremap J N
  nnoremap N J
  "(E)nd of word -> brea(K) of word
  nnoremap k e
  nnoremap e k
  nnoremap K E
  nnoremap E <nop>
  nnoremap h y
  onoremap h y
  "(Y)ank -> (H)aul
  nnoremap y h
  nnoremap H Y
  nnoremap Y H
endfunction

function! Unmap_workman_home_row()
  "Unmaps Workman keys
  silent! nunmap h
  silent! ounmap h
  silent! nunmap j
  silent! nunmap k
  silent! nunmap l
  silent! nunmap y
  silent! nunmap n
  silent! nunmap e
  silent! nunmap o
  silent! nunmap H
  silent! nunmap J
  silent! nunmap K
  silent! nunmap L
  silent! nunmap Y
  silent! nunmap N
  silent! nunmap E
  silent! nunmap O
endfunction

call Workman_minimal()

if has('gui_running')
  "set guioptions-=T  " no toolbar
  "set lines=60 columns=108 linespace=0
  if has('gui_win32')
    set guifont=DejaVu_Sans_Mono:h10:cANSI
  else
    set guifont=DejaVu\ Sans\ Mono\ 9
  endif
endif




"======[ Add a Y command for incremental yank in Visual mode ]==============




"=============== source vimrc if saved =============
augroup VimReload
  autocmd!
  autocmd BufWritePost ~/.nvimrc source ~/.nvimrc
augroup END



"=============== enable local vimrc =============
set exrc
set secure
