" vim:fdm=marker:fdl=0:nofoldenable

" Martin (snusnu) Gamsjaeger's .vimrc
" http://github.com/snusnu

" Options {{{

set nocompatible                     " turn off compatibility with Vi

set magic                            " Enable extended regexp
set hidden                           " allow buffer switching without saving
set nowrap                           " don't wrap long lines by default
set showbreak=↪                      " better line wraps
set autoindent                       " for filetypes that doesn't have indent rules
set relativenumber                   " show relative line numbering
set numberwidth=2                    " display 2 columns

set softtabstop=2                    " soft tab width
set tabstop=2                        " global tab width
set shiftwidth=2                     " number of spaces for (un)indenting
set shiftround                       " round indent to multiple of 'shiftwidth'
set expandtab                        " expand tab characters into spaces
set nojoinspaces                     " prevent inserting two spaces after punctuation on a join (J)"

set hlsearch                         " highlight matches...
set incsearch                        " ...as you type.
set ignorecase                       " case insensitive search
set smartcase                        " ...only when pattern is all lowercase

set nobackup                         " don't make a backup before overwriting a file.
set nowritebackup                    " ^^^
set noswapfile                       " don't need no stinky swapfiles
set directory=~/tmp,/tmp             " keep swap files in one location

set confirm                          " confirm on quit, etc.
set autoread                         " automatically read changes from disk

set showcmd                          " display incomplete commands.
set showmatch                        " when a bracket is inserted, briefly jump to the matching one
set history=1000                     " remember more commands and search history
set undolevels=1000                  " remember more undo steps
set undoreload=10000                 " Maximum number lines to save for undo on a buffer reload
set undodir=~/.vim/.undo              " directory where undo files are stored
set undofile                         " undo previous actions even after you close and reopen a file.

set backspace=indent,eol,start       " intuitive backspacing (over everything in insert mode)
set virtualedit=block                " allow virtual editing in Visual block mode

set foldmethod=syntax                " folding based on syntax
set foldnestmax=3                    " deepest fold is 3 levels
set foldlevel=3
set nofoldenable                     " dont fold by default

set gdefault                         " this makes search/replace global by default
set switchbuf=useopen                " Switch to an existing buffer if one exists

set wildmenu                         " enable ctrl-n and ctrl-p to scroll thru matches
set wildmode=list:longest,full       " make cmdline tab completion similar to bash

" stuff to ignore when tab completing
set wildignore+=*.o,*.obj,*~,*.png,*.gif,*.jpg,*.jpeg,*.zip,*.jar,*.pyc
set wildignore+=*.gem,*/coverage/*,*/log/*,tags,*.rbc,*.ttf,*.eot


" . scan the current buffer ( 'wrapscan' is ignored)
" w scan buffers from other windows
" b scan other loaded buffers that are in the buffer list
" u scan the unloaded buffers that are in the buffer list
" U scan the buffers that are not in the buffer list
set complete=.,w,b,u,U

" Whitespace stuff
set list                             " show trailing whitespace etc
set listchars=tab:»\ ,trail:•,nbsp:· " highlight problematic whitespace
set linespace=0                      " No extra spaces between rows
set winminheight=0                   " Windows can be 0 line high

set scrolljump=2                     " Lines to scroll when cursor leaves screen"
set scrolloff=4                      " context in lines around the cursor
set sidescrolloff=4                  " context in columns around the cursor
set sidescroll=1                     " smooth scrolling by 1 column

set mouse=a                          " Enable mouse in GUI and terminal
set mousehide                        " Hide the mouse cursor while typing"

set vb t_vb=                         " no visual nor audio bell
set splitright                       " put new vsplit windows to the right of the current
set splitbelow                       " put new split windows to the bottom of the current
set pastetoggle=<F2>                 " easy toggling of paste mode

if &diff
  set nonumber                       " no line numbers in vimdiff
endif

set modelines=3                      " check only first 3 lines for modeline
set ttimeoutlen=100                  " time out for terminal key codes

set encoding=utf-8                   " Use utf-8 encoding
set termencoding=utf-8               " ditto
set fileencodings=                   " don't do any encoding conversion (otherwise munges binary files)

syntax on                            " Use colors

set shortmess+=filmnrxoOtT           " Abbrev. of messages (avoids 'hit enter')"
set lazyredraw                       " Don't redraw the screen during complex operations
set ttyfast                          " Indicates a fast terminal connection

set virtualedit=onemore              " Allow for cursor beyond last character

"set ruler                            " Show line numbering
"set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids"

set laststatus=2                     " show the status line all the time
set shell=$SHELL                     " Cause vim to spawn a login shell (will load chruby)

let g:is_bash=1                      " Assume running from bash

if has('mouseshape') " doesn't come with-feature-set=huge
  set mouseshape = s:updown,sd:udsizing,m:arrow,vs:leftright,vd:lrsizing
endif

" }}}

" Key mappings {{{

let mapleader=","

" Fast saving
nnoremap <Leader>w :w<CR>

" copy and paste to system clipboard
noremap <leader>y "+y
noremap <leader>p "+p

" move up/down by screen lines, not file lines
nnoremap j gj
nnoremap k gk

" yank text from cursor till the end of line
nnoremap Y y$

" Create newlines without entering insert mode
nnoremap go o<Esc>k
nnoremap gO O<Esc>j

" remap U to <C-r> for easier redo
nnoremap U <C-r>

" easier way to get out of insert mode
inoremap jk <esc>
inoremap jj <esc>

" Preserve selection when indenting
vmap > >gv
vmap < <gv

" Wrapped lines goes down/up to next row, rather than next line in file.
noremap j gj
noremap k gk

" Same for 0, home, end, etc
noremap $ g$
noremap <End> g<End>
noremap 0 g0
noremap <Home> g<Home>
noremap ^ g^

" The following two lines conflict with moving to top and bottom of the screen
map <S-H> gT
map <S-L> gt

" Code folding options
nmap <leader>f0 :set foldlevel=0<CR>
nmap <leader>f1 :set foldlevel=1<CR>
nmap <leader>f2 :set foldlevel=2<CR>
nmap <leader>f3 :set foldlevel=3<CR>
nmap <leader>f4 :set foldlevel=4<CR>
nmap <leader>f5 :set foldlevel=5<CR>
nmap <leader>f6 :set foldlevel=6<CR>
nmap <leader>f7 :set foldlevel=7<CR>
nmap <leader>f8 :set foldlevel=8<CR>
nmap <leader>f9 :set foldlevel=9<CR>

" Toggle search highlighting
nmap <silent> <leader>/ :set invhlsearch<CR>

" Find merge conflict markers
map <leader>fc /\v^[<\|=>]{7}( .*\|$ )<CR>

" Change Working Directory to that of the current file
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h

" allow the . to execute once for each line of a visual selection
vnoremap . :normal .<CR>

" Map <Leader>ff to display all lines with keyword under cursor
" and ask which one to jump to
nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" Switch to prev buffer
map <leader><leader> <C-^>

" hash rocket!
imap <c-l> <space>=><space>

" convert hash rocket to 1.9 hash syntax
nmap <leader>hr mm:s/\v:(\w+) \=\>/\1:/g<CR>`m

" Easy window switching
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Resizing split windows
nmap <silent> <S-Up> <C-w>-
nmap <silent> <S-Down> <C-w>+
nmap <silent> <S-Left> <C-w>>
nmap <silent> <S-Right> <C-w><

" allow moving with j/k in insert mode
inoremap <c-j> <Down>
inoremap <c-k> <Up>
inoremap <c-h> <Left>
inoremap <c-l> <Right>

" Rebuild CTags
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>

" Fast editing of the .vimrc
nmap <silent> <leader>c :edit $MYVIMRC<CR>

" strip trailing whitespace
nnoremap <silent> <leader><space> mm:%s/\s\+$//e<CR>`m

" auto indent whole file
nnoremap <silent> <leader>= mmgg=G`m

" Expand %% to buffer's path
cnoremap %% <C-R>=expand('%:h').'/'<CR>

" Auto indent whole file
nnoremap <silent> <leader>=call("normal gg=G")<CR>

" Convert markup to HTML
map <Leader>ht = :Hammer<CR>

" Bash like keys for the command line
cnoremap <c-a> <Home>
cnoremap <c-e> <End>
cnoremap <c-p> <Up>
cnoremap <c-n> <Down>
cnoremap <c-b> <Left>
cnoremap <c-f> <Right>
cnoremap <c-d> <Del>
cnoremap <c-k> <C-\>estrpart(getcmdline(), 0, getcmdpos()-1)<cr>

" disable arrow keys
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
noremap  <Up>    <NOP>
noremap  <Down>  <NOP>
noremap  <Left>  <NOP>
noremap  <Right> <NOP>

" Underline the current line with '-'
nnoremap <silent> <leader>ul :t.\|s/./-/\|:nohls<cr>

" Underline the current line with '='
nnoremap <silent> <leader>uul :t.\|s/./=/\|:nohls<cr>

" Surround the commented line with lines.
nnoremap <silent> <leader>cul :normal "lyy"lpwv$r-^"lyyk"lP<cr>

" smart file rename
" stolen from: https://github.com/garybernhardt/dotfiles/blob/master/.vimrc
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'))
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction

map <leader>m :call RenameFile()<cr>

function! ToggleNumbering()
  if &relativenumber
    set number
    set norelativenumber
  else
    set relativenumber
    set nonumber
  endif
endfunc

noremap <leader>n :call ToggleNumbering()<cr>

" Toggle between line/block cursor shapes based on editing mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Find custom built ghc-mod, codex etc
let $PATH = $PATH . ':' . expand("~/.vim/haskell/bin")

" }}}

" Plugins {{{

runtime macros/matchit.vim

filetype off " Vundle needs this for ftdetect to work
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'kana/vim-textobj-user'

let ruby_operators = 1
let ruby_space_errors = 1
let ruby_fold = 1

" Programming languages
Plugin 'vim-ruby/vim-ruby'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'pangloss/vim-javascript'
Plugin 'elzr/vim-json'
Plugin 'vim-scripts/VimClojure'
Plugin 'kchmck/vim-coffee-script'

" Solarized color scheme
Plugin 'jwhitley/vim-colors-solarized'

" fix vim-gitgutter
" highlight SignColumn ctermbg=8
" Set this in case the terminal isn't using solarized theme
" let g:solarized_termcolors=256

Plugin 'scrooloose/nerdtree'
nmap <silent> <leader>y :NERDTreeToggle<CR>
let NERDTreeMapOpenSplit="s"
let NERDTreeMapOpenVSplit="v"
let NERDTreeMinimalUI=1
let NERDTreeIgnore=['\.rbc$', '\~$']

Plugin 'scrooloose/nerdcommenter'

" Airline Status bar
Plugin 'bling/vim-airline'
"let g:airline_powerline_fonts = 1
let g:airline#extensions#syntastic#enabled = 1

" let g:airline_mode_map = {
"   \ '__' : '-',
"   \ 'n'  : 'N',
"   \ 'i'  : 'I',
"   \ 'R'  : 'R',
"   \ 'c'  : 'C',
"   \ 'v'  : 'V',
"   \ 'V'  : 'V',
"   \ 's'  : 'S',
"   \ 'S'  : 'S',
"   \ }

" File finder
Plugin 'ctrlpvim/ctrlp.vim'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*,*/coverage/*,*/profiling/*,*/measurements/*,*/doc/*
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_cmd = 'CtrlP'

Plugin 'terryma/vim-multiple-cursors'
Plugin 'Lokaltog/vim-easymotion'

Plugin 'ZoomWin'
map <leader>z :ZoomWin<CR>

Plugin 'tpope/vim-eunuch'
ca w!! SudoWrite

Plugin 'tpope/vim-unimpaired'
" bubble current line
nmap <C-Down> ]eV=
nmap <C-Up> [eV=
" bubble visual selection lines
vmap <C-Down> ]egv=gv
vmap <C-Up> [egv=gv

Plugin 'mileszs/ack.vim'
map <leader>a :Ack!<Space

Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-surround'
Plugin 'majutsushi/tagbar'
Plugin 'sickill/vim-pasta'
let g:pasta_disabled_filetypes = ['python', 'coffee', 'yaml', 'haskell', 'tagbar' ]

" vim-snipmate + snippets (and utility function providers)
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

Plugin 'tpope/vim-pastie'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
let g:github_token = $GITHUB_TOKEN
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

Plugin 'scrooloose/syntastic'
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_full_redraws = 1

Plugin 'mhinz/vim-signify'
let g:signify_vcs_list = [ 'git' ]
" be compatible with syntastic signs
let g:signify_sign_overwrite = 0
let g:signify_cursorhold_normal = 1

Plugin 'tpope/vim-fugitive'
nmap <leader>gw :Gwrite<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gc :Gcommit -v<CR>
nmap <leader>ga :Gcommit --amend<CR>
nmap <leader>gd :Gdiff<CR>
autocmd BufReadPost fugitive://* set bufhidden=delete
autocmd User fugitive
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif

set diffopt+=vertical
let g:diff_translations = 0

Plugin 'gregsexton/gitv'
let g:Gitv_OpenHorizontal = 1
let g:Gitv_WipeAllOnClose = 1

" Make fugitive and gitv easier to use
cabbrev git Git

Plugin 'wikimatze/hammer.vim'
Plugin 'tpope/vim-haml'
Plugin 'slim-template/vim-slim'
Plugin 'timcharper/textile.vim'
Plugin 'zaiste/tmux.vim'

Plugin 'hail2u/vim-css3-syntax'
Plugin 'othree/html5.vim'
" let g:html5_event_handler_attributes_complete = 0
let g:html5_rdfa_attributes_complete = 0
let g:html5_microdata_attributes_complete = 0
let g:html5_aria_attributes_complete = 0

Plugin 'mustache/vim-mode'
let g:mustache_abbreviations = 1

Plugin 'puppetlabs/puppet-syntax-vim'
Plugin 'groenewege/vim-less'
Plugin 'edsono/vim-matchit'

Plugin 'godlygeek/tabular'
vnoremap <leader>t= :Tab /=<cr>
vnoremap <leader>t> :Tab /=><cr>
vnoremap <leader>t: :Tab /\w:\zs/l0l1<cr>

Plugin 'michaeljsmith/vim-indent-object'

Plugin 'mbbill/undotree'
nnoremap <leader>u :UndotreeToggle<cr>
let g:undotree_WindowLayout = 3
let g:undotree_SplitWidth = 30
let g:undotree_DiffAutoOpen = 0
let g:undotree_DiffpanelHeight = 10

Plugin 'rstacruz/sparkup'
Plugin 'jiangmiao/auto-pairs'
let g:AutoPairsShortcutToggle = '<M-p>' " default

" Idris support

Bundle 'idris-hackers/idris-vim'
let g:idris_conceal = 1

" Haskell Support

Bundle 'raichoo/haskell-vim'

" Enable some tabular presets for Haskell
let g:haskell_tabular = 1

Bundle 'enomsg/vim-haskellConcealPlus'
" Pretty unicode haskell symbols
let g:haskell_conceal_wide = 1
let g:haskell_conceal_enumerations = 1
let hscoptions="𝐒𝐓𝐄𝐌xRtB𝔻"

" Needed by ghcmod-vim
Bundle 'Shougo/vimproc.vim'
Bundle 'eagletmt/ghcmod-vim'

Bundle 'eagletmt/neco-ghc'

" Show types in completion suggestions
let g:necoghc_enable_detailed_browse = 1

Bundle 'Twinside/vim-hoogle'

call vundle#end()
filetype plugin indent on " enable indendation/internal plugins after Vundle

" }}}

" Use same color behind concealed unicode characters
hi clear Conceal

" Tags {{{

set tags=tags;/,codex.tags;/

let g:tagbar_type_haskell = {
    \ 'ctagsbin'  : 'hasktags',
    \ 'ctagsargs' : '-x -c -o-',
    \ 'kinds'     : [
        \  'm:modules:0:1',
        \  'd:data: 0:1',
        \  'd_gadt: data gadt:0:1',
        \  't:type names:0:1',
        \  'nt:new types:0:1',
        \  'c:classes:0:1',
        \  'cons:constructors:1:1',
        \  'c_gadt:constructor gadt:1:1',
        \  'c_a:constructor accessors:1:1',
        \  'ft:function types:1:1',
        \  'fi:function implementations:0:1',
        \  'o:others:0:1'
    \ ],
    \ 'sro'        : '.',
    \ 'kind2scope' : {
        \ 'm' : 'module',
        \ 'c' : 'class',
        \ 'd' : 'data',
        \ 't' : 'type'
    \ },
    \ 'scope2kind' : {
        \ 'module' : 'm',
        \ 'class'  : 'c',
        \ 'data'   : 'd',
        \ 'type'   : 't'
    \ }
\ }

" Generate haskell tags with codex and hscope
map <leader>tg :!codex update --force<CR>:call system("git hscope -X TemplateHaskell")<CR><CR>:call LoadHscope()<CR>

map <leader>tt :TagbarToggle<CR>

set csprg=~/.vim/haskell/bin/hscope
set csto=1 " search codex tags first
set cst
set csverb
nnoremap <silent> <C-\> :cs find c <C-R>=expand("<cword>")<CR><CR>

" Automatically make cscope connections
function! LoadHscope()
  let db = findfile("hscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/hscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  endif
endfunction

au BufEnter /*.hs call LoadHscope()

" }}}

" Autocommands {{{

" Use stylish haskell instead of par for haskell buffers
autocmd FileType haskell let &formatprg="stylish-haskell"

nmap <silent> <leader><cr> :noh<cr>
augroup haskell
  autocmd!
  autocmd FileType haskell map <silent> <leader><cr> :noh<cr>:GhcModTypeClear<cr>:SyntasticReset<cr>
  autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
augroup END


" Haskell Interrogation {{{

set completeopt+=longest

" Use buffer words as default tab completion
let g:SuperTabDefaultCompletionType = '<c-x><c-p>'

" But provide (neco-ghc) omnicompletion
if has("gui_running")
  imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
else " no gui
  if has("unix")
    inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
  endif
endif

" Type of expression under cursor
nmap <silent> <leader>ht :GhcModType<CR>
" Insert type of expression under cursor
nmap <silent> <leader>hT :GhcModTypeInsert<CR>
" GHC errors and warnings
nmap <silent> <leader>hc :SyntasticCheck ghc_mod<CR>
" Haskell Lint
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['haskell'] }
nmap <silent> <leader>hl :SyntasticCheck hlint<CR>

" Hoogle the word under the cursor
nnoremap <silent> <leader>hh :Hoogle<CR>

" Hoogle and prompt for input
nnoremap <leader>hH :Hoogle

" Hoogle for detailed documentation (e.g. "Functor")
nnoremap <silent> <leader>hi :HoogleInfo<CR>

" Hoogle for detailed documentation and prompt for input
nnoremap <leader>hI :HoogleInfo

" Hoogle, close the Hoogle window
nnoremap <silent> <leader>hz :HoogleClose<CR>

" }}}

" Conversion {{{

function! Pointfree()
  call setline('.', split(system('pointfree '.shellescape(join(getline(a:firstline, a:lastline), "\n"))), "\n"))
endfunction
vnoremap <silent> <leader>h. :call Pointfree()<CR>

function! Pointful()
  call setline('.', split(system('pointful '.shellescape(join(getline(a:firstline, a:lastline), "\n"))), "\n"))
endfunction
vnoremap <silent> <leader>h> :call Pointful()<CR>

" }}}

augroup misc

  au!

  " jump to last position when opening a file,
  " don't do it when writing a commit log entry
  au BufReadPost *
    \ if &filetype !~ 'commit\c' |
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \ exe "normal g`\"" |
    \ endif |
    \ endif

  " open help in vertical split
  au BufWinEnter *.txt,*.txt.gz if &ft == 'help' | wincmd L | endif

  " Resize splits when the window is resized
  au VimResized * exe "normal! \<c-w>="

  au FileType *
    \ if &omnifunc == "" |
    \   setlocal omnifunc=syntaxcomplete#Complete |
    \ endif

  " Source ~/.vimrc after saving it
  au BufWritePost .vimrc,vimrc source $MYVIMRC

  " Thorfile, Rakefile and Gemfile are Ruby
  au BufRead,BufNewFile {Gemfile,Rakefile,Thorfile,Guardfile,*.ru,*.prawn,pryrc,aprc} set ft=ruby

  au BufRead,BufNewFile *bash* let b:is_bash=1 | setfiletype sh

  function! Preserve(command)
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    execute a:command
    " Clean up: restore previous search history and cursor position
    let @/=_s
    call cursor(l, c)
  endfunction

  " Strip trailing whitespace
  function! StripTrailingWhitespace()
      call Preserve("%s/\\s\\+$//e")
  endfunction

  au BufWritePre *.rb,*.ms,*.html,*.js,*.ru,*.rake,*.md,*.py,*.js,*.md,*.hs,vimrc :call StripTrailingWhitespace()

  " save on losing focus
  au FocusLost * :wa

augroup END

" Commands {{{

" apply an arbitrary command to every line found by :vim search
:com! -nargs=1 Qfdo try | sil cfirst |
\ while 1 | exec <q-args> | sil cn | endwhile |
\ catch /^Vim\%((\a\+)\)\=:E\%(553\|42\):/ |
\ endtry

" apply an arbitrary command to every file found by :vim search
:com! -nargs=1 Qfdofile try | sil cfirst |
\ while 1 | exec <q-args> | sil cnf | endwhile |
\ catch /^Vim\%((\a\+)\)\=:E\%(553\|42\):/ |
\ endtry

" ---------------
" Make a scratch buffer with all of the leader keybindings.
"
" Adapted from http://ctoomey.com/posts/an-incremental-approach-to-vim/
" ---------------
function! ListLeaders()
  silent! redir @b
  silent! nmap <LEADER>
  silent! redir END
  silent! new
  silent! set buftype=nofile
  silent! set bufhidden=hide
  silent! setlocal noswapfile
  silent! put! b
  silent! g/^s*$/d
  silent! %s/^.*,//
  silent! normal ggVg
  silent! sort
  silent! let lines = getline(1,"$")
  silent! normal <esc>
endfunction

command! ListLeaders :call ListLeaders()

" }}}

" ~~~~~~~~~~~~ include local config  ~~~~~~~~~~~~~~

syntax enable
set background=dark

"must come after vundle#end()
colorscheme solarized

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
