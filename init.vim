" vim:fdm=marker:fdl=0:nofoldenable

" Martin (snusnu) Gamsjaeger's init.vim
" http://github.com/snusnu

set nocompatible                     " turn off compatibility with Vi
set termguicolors
set magic                            " Enable extended regexp
set hidden                           " allow buffer switching without saving
set nowrap                           " don't wrap long lines by default
set showbreak=↪                      " better line wraps
set autoindent                       " for filetypes that doesn't have indent rules
set number                           " show line numbering
set norelativenumber                 " show absolute line numbers
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
set modelines=3                      " check only first 3 lines for modeline
set encoding=utf-8                   " Use utf-8 encoding
set termencoding=utf-8               " ditto
set fileencodings=                   " don't do any encoding conversion (otherwise munges binary files)
set shortmess+=filmnrxoOtT           " Abbrev. of messages (avoids 'hit enter')"
set lazyredraw                       " Don't redraw the screen during complex operations
set ttyfast                          " Indicates a fast terminal connection
set virtualedit=onemore              " Allow for cursor beyond last character
set laststatus=2                     " show the status line all the time
set shell=$SHELL                     " Cause vim to spawn a login shell (will load chruby)
set background=dark

set wildignore+=*.o,*.obj,*~,*.png,*.gif,*.jpg,*.jpeg,*.zip,*.jar,*.pyc
set wildignore+=*.gem,*/coverage/*,*/log/*,tags,*.rbc,*.ttf,*.eot
"set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)

" . scan the current buffer ( 'wrapscan' is ignored)
" w scan buffers from other windows
" b scan other loaded buffers that are in the buffer list
" u scan the unloaded buffers that are in the buffer list
" U scan the buffers that are not in the buffer list
set complete=.,w,b,u,U

" NeoVim handles ESC keys as alt+key, set this to solve the problem
set ttimeout
set ttimeoutlen=0

set inccommand=nosplit

if &diff
  set nonumber                       " no line numbers in vimdiff
endif

syntax on                            " Use colors
filetype plugin indent on

" Toggle between line/block cursor shapes based on editing mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

let g:is_bash=1                      " Assume running from bash
let mapleader=","

" Disable arrow keys
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
noremap  <Up>    <NOP>
noremap  <Down>  <NOP>
noremap  <Left>  <NOP>
noremap  <Right> <NOP>

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

" hash rocket
imap <c-l> <space>=><space>

" convert hash rocket to 1.9 hash syntax
nmap <leader>hr mm:s/\v:(\w+) \=\>/\1:/g<CR>`m

" Easy window switching
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Resizing split windows
nmap <silent> <S-Up> <C-w>+
nmap <silent> <S-Down> <C-w>-
nmap <silent> <S-Left> <C-w><
nmap <silent> <S-Right> <C-w>>

" allow moving with j/k in insert mode
inoremap <c-j> <Down>
inoremap <c-k> <Up>
inoremap <c-h> <Left>
inoremap <c-l> <Right>

" strip trailing whitespace
nnoremap <silent> <leader><space> mm:%s/\s\+$//e<CR>`m

" auto indent whole file
nnoremap <silent> <leader>= mmgg=G`m

" Expand %% to buffer's path
cnoremap %% <C-R>=expand('%:h').'/'<CR>

" Auto indent whole file
nnoremap <silent> <leader>=call("normal gg=G")<CR>

" Bash like keys for the command line
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-d> <Del>
cnoremap <C-k> <C-\>estrpart(getcmdline(), 0, getcmdpos()-1)<cr>

" Underline the current line with '-'
nnoremap <silent> <leader>ul :t.\|s/./-/\|:nohls<cr>

" Underline the current line with '='
nnoremap <silent> <leader>uul :t.\|s/./=/\|:nohls<cr>

" Surround the commented line with lines.
nnoremap <silent> <leader>cul :normal "lyy"lpwv$r-^"lyyk"lP<cr>

vnoremap <leader>ll :EasyAlign * /[{}]/<cr>

" Exit terminal mode using <ESC>
tnoremap <Esc> <C-\><C-n>

" Send <ESC> to the terminal
tnoremap <C-v><Esc> <Esc>

" Make navigation into and out of Neovim terminal splits nicer.
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l

map "p vi"p
map 'p vi'p
map (p vi(p
map )p vi)p

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

" Toggle line numbering between absolute and relative
function! ToggleNumbering()
  if &relativenumber
    set number
    set norelativenumber
  else
    set relativenumber
    set number
  endif
endfunc

noremap <leader>n :call ToggleNumbering()<cr>

" Make a scratch buffer with all of the leader keybindings.
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

" Apply an arbitrary command to every line found by :vim search
:com! -nargs=1 Qfdo try | sil cfirst |
  \ while 1 | exec <q-args> | sil cn | endwhile |
  \ catch /^Vim\%((\a\+)\)\=:E\%(553\|42\):/ |
  \ endtry

" Apply an arbitrary command to every file found by :vim search
:com! -nargs=1 Qfdofile try | sil cfirst |
  \ while 1 | exec <q-args> | sil cnf | endwhile |
  \ catch /^Vim\%((\a\+)\)\=:E\%(553\|42\):/ |
  \ endtry

if executable('rg')
  set grepprg=rg\ --vimgrep
endif

call plug#begin('~/.local/share/nvim/plugged')
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'iCyMind/NeoSolarized'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'neomake/neomake'
Plug 'parsonsmatt/intero-neovim'
Plug 'vim-ruby/vim-ruby'
Plug 'jgdavey/vim-blockle'
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
Plug 'kchmck/vim-coffee-script'
Plug 'vito-c/jq.vim'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-signify'
Plug 'mbbill/undotree'
Plug 'lifepillar/pgsql.vim'
Plug 'christoomey/vim-sort-motion'
Plug 'machakann/vim-highlightedyank'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-fugitive'
Plug 'jreybert/vimagit'
Plug 'janko-m/vim-test'
Plug 'kassio/neoterm'
Plug 'szw/vim-maximizer'

" Text objects
Plug 'wellle/targets.vim'                     " Additional text objects
Plug 'michaeljsmith/vim-indent-object'        " Indented text object
Plug 'kana/vim-textobj-user'                  " Add additional text objects
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'jceb/vim-textobj-uri'                   " URL objects
Plug 'glts/vim-textobj-comment'               " Comment text objects
Plug 'kana/vim-textobj-function'              " Add function based text objects
Plug 'bag-man/vim-textobj-keyvalue'           " Key value object
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'thinca/vim-textobj-function-javascript' " Add JS function object
Plug 'tpope/vim-jdaddy'                       " JSON text object
Plug 'reedes/vim-textobj-sentence'            " Sentence object<Paste>
call plug#end()

" Plug 'iCyMind/NeoSolarized'
if filereadable(expand("$HOME/.local/share/nvim/plugged/NeoSolarized/colors/NeoSolarized.vim"))
  colorscheme NeoSolarized
endif

" Plug 'neomake/neomake'
call neomake#configure#automake('nw', 1000)

" Plug kassio/neoterm
let g:neoterm_repl_ruby = 'bundle exec rails console'
let g:neoterm_autoscroll = 1
" 3<leader>tc will clear neoterm-3.
nnoremap <leader>tc :<c-u>exec v:count.'Tclear'<cr>

nmap gx <Plug>(neoterm-repl-send)
xmap gx <Plug>(neoterm-repl-send)
nmap gxx <Plug>(neoterm-repl-send-line)

" Plug janko-m/vim-test
let test#strategy = 'neoterm'
let test#enabled_runners = ["ruby#rspec"]
let g:test#ruby#rspec#executable = 'RAILS_ENV=test bundle exec rspec'
let g:test#ruby#rspec#options = '--backtrace'
let test#neovim#term_position = "topleft"

nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>

" Plug 'szw/vim-maximizer'
let g:maximizer_default_mapping_key = '<leader>z'

" Plug 'scrooloose/nerdtree'
nmap <silent> <leader>y :NERDTreeToggle<CR>
let NERDTreeMapOpenSplit="s"
let NERDTreeMapOpenVSplit="v"
let NERDTreeMinimalUI=1
let NERDTreeIgnore=['\.rbc$', '\~$']

" Plug 'mhinz/vim-signify'
let g:signify_vcs_list = [ 'git' ]
" be compatible with syntastic signs
"let g:signify_sign_overwrite = 0
"let g:signify_cursorhold_normal = 1

" Plug 'mbbill/undotree'
nnoremap <leader>u :UndotreeToggle<cr>
let g:undotree_WindowLayout = 4
let g:undotree_ShortIndicators = 1
let g:undotree_SplitWidth = 30
let g:undotree_DiffAutoOpen = 0
let g:undotree_DiffpanelHeight = 15
let g:undotree_SetFocusWhenToggle = 1

" Plug 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Plug #neovimhaskell/haskell-vim#
let g:haskell_enable_quantification = 1   " highlight `forall`
let g:haskell_enable_recursivedo = 1      " highlight `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " highlight `proc`
let g:haskell_enable_pattern_synonyms = 1 " highlight `pattern`
let g:haskell_enable_typeroles = 1        " highlight type roles
let g:haskell_enable_static_pointers = 1  " highlight `static`
let g:haskell_backpack = 1                " highlight backpack keywords

" Plug 'lifepillar/pgsql.vim'
let g:sql_type_default = 'pgsql'

" Plug 'jgdavey/vim-blockle'
let g:blockle_mapping = '<Leader>bl'

" Intero starts automatically. Set this if you'd like to prevent that.
let g:intero_start_immediately = 0
let g:intero_type_on_hover = 1
set updatetime=1000

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': '10split enew' }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

nmap <C-p> :Files<cr>
imap <c-x><c-l> <plug>(fzf-complete-line)

let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ -g "*.{js,json,php,md,styl,pug,jade,html,config,py,cpp,c,go,hs,rb,conf,fa,lst}"
  \ -g "!{.config,.git,node_modules,vendor,build,yarn.lock,*.sty,*.bst,*.coffee,dist}/*" '

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)

noremap <C-p> :FZF<cr>

" --column:        Show column number
" --line-number:   Show line number
" --no-heading:    Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case:   Case insensitive search
" --no-ignore:     Do not respect .gitignore, etc...
" --hidden:        Search hidden files and folders
" --follow:        Follow symlinks
" --glob:          Additional conditions for search
" --color:         Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

augroup misc
  au!

  " Jump to last position when opening a file,
  " don't do it when writing a commit log entry
  au BufReadPost *
    \ if &filetype !~ 'commit\c' |
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \ exe "normal g`\"" |
    \ endif |
    \ endif

  " open help in vertical split
  au BufWinEnter *.txt
    \ *.txt.gz
    \ if &ft == 'help' | wincmd L | endif

  au BufWritePost init.vim
    \ source $HOME/.config/nvim/init.vim

  au BufRead,BufNewFile '
    \ *.ru
    \ *.prawn
    \ Gemfile
    \ Rakefile
    \ Thorfile
    \ Guardfile
    \ pryrc
    \ aprc'
    \ set ft=ruby

  au BufRead,BufNewFile *bash*
    \ let b:is_bash=1 | setfiletype sh

  au BufWritePre *.rb,*.ms,*.html,*.js,*.ru,*.rake,*.md,*.py,*.js,*.md,*.hs,*.sql,vimrc,*.vim
    \ :call StripTrailingWhitespace()

  au BufRead,BufNewFile *.json
    \ set filetype=json

  au FocusLost * :wa

  au WinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline

  au InsertEnter * setlocal colorcolumn=80
  au InsertLeave * setlocal colorcolumn=0
augroup END

augroup intero
  au!

  " Background process and window management
  au FileType haskell nnoremap <silent> <leader>is :InteroStart<CR>
  au FileType haskell nnoremap <silent> <leader>ik :InteroKill<CR>

  " Open intero/GHCi split horizontally
  au FileType haskell nnoremap <silent> <leader>io :InteroOpen<CR>
  " Open intero/GHCi split vertically
  au FileType haskell nnoremap <silent> <leader>iov :InteroOpen<CR><C-W>H
  au FileType haskell nnoremap <silent> <leader>ih :InteroHide<CR>

  " Automatically reload on save
  au BufWritePost *.hs InteroReload
  " Manually save and reload
  "au FileType haskell nnoremap <silent> <leader>wr :w \| :InteroReload<CR>

  " Load individual modules
  au FileType haskell nnoremap <silent> <leader>il :InteroLoadCurrentModule<CR>
  au FileType haskell nnoremap <silent> <leader>if :InteroLoadCurrentFile<CR>

  " Type-related information
  au FileType haskell map <silent> <leader>t <Plug>InteroGenericType
  au FileType haskell map <silent> <leader>T <Plug>InteroType
  au FileType haskell nnoremap <silent> <leader>it :InteroTypeInsert<CR>

  " Navigation
  au FileType haskell nnoremap <silent> <leader>jd :InteroGoToDef<CR>

  " Managing targets
  " Prompts you to enter targets (no silent):
  au FileType haskell nnoremap <leader>ist :InteroSetTargets<SPACE>
augroup END

augroup fzf
  au!

  autocmd! FileType fzf
  autocmd  FileType fzf
    \ set laststatus=0 noshowmode noruler |
    \ autocmd BufLeave <buffer>
    \ set laststatus=2 showmode ruler
augroup END

" ~~~~~~~~~~~~ include local config  ~~~~~~~~~~~~~~

" Source local configuration
if filereadable(expand("~/.init.vim.local"))
  source ~/.init.vim.local
endif
