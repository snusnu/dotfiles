" vim:fdm=marker:fdl=0:nofoldenable

syntax on
filetype plugin indent on

set autoindent                       " for filetypes that doesn't have indent rules
set autoread                         " automatically read changes from disk
set background=dark                  " Use dark theme by default
set backspace=indent,eol,start       " intuitive backspacing (over everything in insert mode)
set complete=.,w,b,u,U               " . scan the current buffer ( 'wrapscan' is ignored)
                                     " w scan buffers from other windows
                                     " b scan other loaded buffers that are in the buffer list
                                     " u scan the unloaded buffers that are in the buffer list
                                     " U scan the buffers that are not in the buffer list
set confirm                          " confirm on quit, etc.
set directory=~/tmp,/tmp             " keep swap files in one location
set encoding=utf-8                   " Use utf-8 encoding
set expandtab                        " expand tab characters into spaces
set fileencodings=                   " don't do any encoding conversion (otherwise munges binary files)
set foldlevel=3
set foldmethod=syntax                " folding based on syntax
set foldnestmax=3                    " deepest fold is 3 levels
set gdefault                         " this makes search/replace global by default
set hidden                           " allow buffer switching without saving
set history=1000                     " remember more commands and search history
set hlsearch                         " highlight matches...
set ignorecase                       " case insensitive search
set inccommand=nosplit
set incsearch                        " ...as you type.
set laststatus=2                     " show the status line all the time
set lazyredraw                       " Don't redraw the screen during complex operations
set linespace=0                      " No extra spaces between rows
set list                             " show trailing whitespace etc
set listchars=tab:»\ ,trail:•,nbsp:· " highlight problematic whitespace
set magic                            " Enable extended regexp
set modelines=3                      " check only first 3 lines for modeline
set mouse=a                          " Enable mouse in GUI and terminal
set mousehide                        " Hide the mouse cursor while typing"
set nobackup                         " don't make a backup before overwriting a file.
set nocompatible                     " turn off compatibility with Vi
set nofoldenable                     " dont fold by default
set nojoinspaces                     " prevent inserting two spaces after punctuation on a join (J)"
set norelativenumber                 " show absolute line numbers
set noswapfile                       " don't need no stinky swapfiles
set nowrap                           " don't wrap long lines by default
set nowritebackup                    " ^^^
set number                           " show line numbering
set numberwidth=2                    " display 2 columns
set pastetoggle=<F2>                 " easy toggling of paste mode
set scrolljump=2                     " Lines to scroll when cursor leaves screen"
set scrolloff=4                      " context in lines around the cursor
set shell=$SHELL                     " Cause vim to spawn a login shell (will load chruby)
set shiftround                       " round indent to multiple of 'shiftwidth'
set shiftwidth=2                     " number of spaces for (un)indenting
set shortmess+=filmnrxoOtT           " Abbrev. of messages (avoids 'hit enter')"
set showbreak=↪                      " better line wraps
set showcmd                          " display incomplete commands.
set showmatch                        " when a bracket is inserted, briefly jump to the matching one
set sidescroll=1                     " smooth scrolling by 1 column
set sidescrolloff=4                  " context in columns around the cursor
set smartcase                        " ...only when pattern is all lowercase
set softtabstop=2                    " soft tab width
set splitbelow                       " put new split windows to the bottom of the current
set splitright                       " put new vsplit windows to the right of the current
set switchbuf=useopen                " Switch to an existing buffer if one exists
set tabstop=2                        " global tab width
set termencoding=utf-8
set termguicolors
set ttimeout                         " NeoVim handles ESC keys as alt+key, set this to solve the problem
set ttimeoutlen=0
set ttyfast                          " Indicates a fast terminal connection
set undodir=~/.vim/.undo              " directory where undo files are stored
set undofile                         " undo previous actions even after you close and reopen a file.
set undolevels=1000                  " remember more undo steps
set undoreload=10000                 " Maximum number lines to save for undo on a buffer reload
set updatetime=100                   " default updatetime 4000ms is not good for async update
set vb t_vb=                         " no visual nor audio bell
set virtualedit=block                " allow virtual editing in Visual block mode
set virtualedit=onemore              " Allow for cursor beyond last character
set wildignore+=*.gem,*/coverage/*,*/log/*,tags,*.rbc,*.ttf,*.eot
set wildignore+=*.o,*.obj,*~,*.png,*.gif,*.jpg,*.jpeg,*.zip,*.jar,*.pyc
set wildmenu                         " enable ctrl-n and ctrl-p to scroll thru matches
set wildmode=list:longest,full       " make cmdline tab completion similar to bash
set winminheight=0                   " Windows can be 0 line high
"set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)

if &diff
  set nonumber                       " no line numbers in vimdiff
endif

if executable('rg')
  set grepprg=rg\ --vimgrep
endif

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

" Expand %% to buffer's path
cnoremap %% <C-R>=expand('%:h').'/'<CR>

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

" smart file rename https://github.com/garybernhardt/dotfiles/blob/master/.vimrc
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

call plug#begin('~/.local/share/nvim/plugged')
Plug 'AndrewRadev/splitjoin.vim'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-sort-motion'
Plug 'elzr/vim-json'
Plug 'iCyMind/NeoSolarized'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'lifepillar/pgsql.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'mbbill/undotree'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'neovimhaskell/haskell-vim'
Plug 'm00qek/vim-pointfree'
Plug 'pangloss/vim-javascript'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'szw/vim-maximizer'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vito-c/jq.vim'

" Text objects
Plug 'bag-man/vim-textobj-keyvalue'           " Key value object
Plug 'glts/vim-textobj-comment'               " Comment text objects
Plug 'jceb/vim-textobj-uri'                   " URL objects
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-function'              " Add function based text objects
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-user'                  " Add additional text objects
Plug 'michaeljsmith/vim-indent-object'        " Indented text object
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'reedes/vim-textobj-sentence'            " Sentence object<Paste>
Plug 'thinca/vim-textobj-function-javascript' " Add JS function object
Plug 'tpope/vim-jdaddy'                       " JSON text object
Plug 'wellle/targets.vim'                     " Additional text objects
call plug#end()

" Plug 'iCyMind/NeoSolarized'
if filereadable(expand("$HOME/.local/share/nvim/plugged/NeoSolarized/colors/NeoSolarized.vim"))
  colorscheme NeoSolarized
endif

" Plug 'szw/vim-maximizer'
let g:maximizer_default_mapping_key = '<leader>z'
let g:maximizer_set_default_mapping = 0
let g:maximizer_set_mapping_with_bang = 0

" Plug 'preservim/nerdtree'
nmap <silent> <leader>y :NERDTreeToggle<CR>
let NERDTreeMapOpenSplit="s"
let NERDTreeMapOpenVSplit="v"
let NERDTreeMinimalUI=1
let NERDTreeIgnore=['\.rbc$', '\~$']

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

" Plug 'lifepillar/pgsql.vim'
let g:sql_type_default = 'pgsql'

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

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" airblade/vim-gitgutter
let g:gitgutter_preview_win_floating = 0

" haskell-vim
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

" m00qek/pointfree
nnoremap <silent> <Leader>. :call pointfree#suggestions()<CR>
vnoremap <silent> <Leader>. :call pointfree#selection()<CR>

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <silent><expr> <c-space> coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Show documentation in preview window
nnoremap <silent> <leader>cd :call <SID>show_documentation()<CR>

" Navigate diagnostics
nmap <silent> <leader>cp <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>cn <Plug>(coc-diagnostic-next)

" Goto actions
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Format selected region
nmap <silent> <leader>cf :call CocAction('format')<cr>

" Code action of current line
nmap <leader>ca <Plug>(coc-codeaction)

" Fix autofix problem of current line
nmap <leader>cq <Plug>(coc-fix-current)

" Restart coc
nmap <leader>cr :CocRestart<cr>

" Rename current word
nmap <leader>rn <Plug>(coc-rename)

" Using CocList
nmap <leader>ff :CocList list<cr>
nmap <leader>fb :CocList buffers<cr>
nmap <leader>fg :CocList grep<cr>
nmap <leader>fw :CocList words<cr>

augroup misc
  au!

  " Jump to last position when opening a file,
  " don't do it when writing a commit log entry
  au BufReadPost *
    \ if &filetype !~ 'commit\c' |
    \   if line("'\"") > 0 && line("'\"") <= line("$") |
    \     exe "normal g`\"" |
    \   endif |
    \ endif

  " open help in vertical split
  au BufWinEnter *.txt,*.txt.gz if &ft == 'help' | wincmd L | endif

  " source config after saving it
  au BufWritePost init.vim source $HOME/.config/nvim/init.vim

  au BufRead,BufNewFile '
    \ *.prawn
    \ *.ru
    \ Gemfile
    \ Guardfile
    \ Rakefile
    \ Thorfile
    \ aprc
    \ pryrc'
    \ set ft=ruby

  au BufRead,BufNewFile *bash* let b:is_bash=1 | setfiletype sh

  au BufWritePre '
    \ *.hs
    \ *.html
    \ *.js
    \ *.md
    \ *.ms
    \ *.py
    \ *.rake
    \ *.rb
    \ *.ru
    \ *.sql
    \ *.vim
    \ vimrc'
    \ :call StripTrailingWhitespace()

  au BufRead,BufNewFile *.json set filetype=json

  " Highlight symbol under cursor on CursorHold
  au CursorHold * silent call CocActionAsync('highlight')
    " Update signature help on jump placeholder
  au User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

  au FocusLost * :wa

  au WinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline

  au InsertEnter * setlocal colorcolumn=80
  au InsertLeave * setlocal colorcolumn=0
augroup END

augroup fzf
  au!

  autocmd! FileType fzf

  if !exists('g:fzf_layout')
    autocmd  FileType fzf
      \ set laststatus=0 noshowmode noruler |
      \ autocmd BufLeave <buffer>
      \ set laststatus=2 showmode ruler
  endif

augroup END

" ~~~~~~~~~~~~ include local config  ~~~~~~~~~~~~~~

" Source local configuration
if filereadable(expand("~/.init.vim.local"))
  source ~/.init.vim.local
endif
