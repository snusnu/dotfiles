# Using vim

All mappings are active by default when using the [vimrc][8] found in [snusnu/dotfiles][1].
The `,` key is configured to be the `<leader>`.

## Basics

Vim provides different modes for editing text. The most important ones are listed in the table below:

| Mode           | Purpose                                       | Cmd to enter      | Help                      |
| -------------- | --------------------------------------------- | ----------------- | ------------------------- |
| normal         | navigate and manipulate                       | `<ESC>`           | `:help Normal-mode`       |
| command        | enter editor commands (like `:help`)          | `:`               | `:help Command-line-mode` |
| insert         | insert new text                               | `i/I/a/A/o/O/c/C` | `:help Insert-mode`       |
| visual         | create and manipulate selections              | `V`               | `:help Visual-mode`       |
| visual block   | create and manipulate rectangular selections  | `<C-v>`           | `:help Visual-mode`       |

### Comparison with other editors

Typical editors operate in "insert mode". Every key pressed gets added to
the currently active buffer, editor commands are activated by using the
mouse to search through rich context menus. Often, some keyword shortcuts
are active by default and can be configured via GUI interactions. Sometimes
this configuration can "even" be persisted in plaintext files consumable by
humans. In a few cases, the editor might even be completely scriptable.

In vim, insert mode is "rarely" active and is exclusively used for actually
writing text. Amost everything about the editor itself, as well as using it,
is fairly easy to configure with a somewhat arcane (yet powerful) scripting
language aptly called `vimscript`.

Common editing commands like

* Opening files for editing
* Moving around in files
* Copying text in order to paste it somewhere else
* Pasteing previously yanked text
* Selecting text to be changed, deleted, moved or copied
* Searching for exact or pattern matches
* Replacing text
* ...

can be activated / prepared / achieved outside of insert mode, most commonly
in either **normal**, **visual** or **command** mode. Vim is designed for
**efficient text editing**, activating editor commands should not involve a lot
of moving away from the home row of the keyboard. The goal is to get as much
work done as possible with the least amount of keystrokes, let alone mouse
action. "Complicated" text manipulations that might involve a lot of mouse
interactions and tedious repetition in other editors are often quick and easy,
**without ever pressing arrow keys or reaching out for the mouse**.

This is achieved by allowing the user to send **commands** to vim while not
in insert mode. These commands are available via **key mappings** that are
themselves defined to be active only if one (or more) specific modes are active.

#### The notation used for displaying and configuring key mappings

The notation shown in this section and used throughout this document,
is the same that is used to configure vim itself (via `~/.vimrc`).

If a command is prefixed with `{VISUAL}` (all uppercase) it is meant to be
executed **only** in visual mode. If the command is prefixed with `{visual}`
(all lowercase), it is available in both normal and visual mode. The prefix
itself **does not** form part of the command and is therefore not meant to
be typed in at the keyboard.

#### Mnemonics for control characters found on typical keyboards:

* `<CR>` refers to `Enter`
* `<Down>`, `<Up>`, `<Left>`, `<Right>` refer to the arrow keys
* `<Space>` refers to the space bar

#### Key mappings sometimes start with control characters:

* `<C-x>` means holding down `Ctrl` while pressing `x`
* `<M-a>` means holding down `Alt` and pressing `a`
* `<S-Left>` means holding down `Shift` and pressing `<Left>`

#### User configurable `<leader>` mappings

The `<leader>` prefix is a user defined key that "scopes" user configured mappings.

* `<leader>u` means pressing `<leader>` (quickly) followed by `u`

### Open files for editing

Typically, files are either browsed with a focus on structure, or opened/closed
for editing their contents. The [NERDTree][2] and [CtrlP][3] plugins can be used
together to satisfy both usecases.

#### NERDTree

For browsing a directory containing code, it can be nice to see the
hierarchical structure (e.g. to become familiar with the project).
For this, as well as for easy adding, removing, copying and renaming
files, the `NERDTree` plugin can come in handy.

* `<leader>y` to toggle the `NERDTree` buffer
* `j/k` to move down/up the listed directories/files
* With the cursor on some directory/file in `NERDTree` buffer
    * `<CR>` to descend into a directory or open a file
    * `R` to **r**eload the contents of a directory
    * `m` to **m**odify the node, followed by
        * `a` to **a**dd a file (end with `/` to add a directory)
        * `m` to **m**ove (rename) a file
        * `d` to **d**elete a file
            * Confirm directory deletion with `y` (empty) or `yes` (non-empty)
        * `c` to **c**opy to new location
* `C` to **c**hange to (descend into) the directory under the cursor
* `U` to set the root of the file hierarchy one level **u**p (higher)

#### CtrlP

For opening various files during regular coding, it's more efficient to use a
`MRU` (most recently used) fuzzy file finder plugin like [CtrlP][3].
When activated, any sequence of characters that occurs in a file's path
(relative to the project root) can be typed at the prompt. The list of matching
files gets automatically narrowed down while typing.

* Press `<C-p>` to open [CtrlP][3]
* Type any sequence of characters that occur in the file's path (in that order)
    * A file at `path/to/some/nested/file` can be reached by `sonefi`
    * All files inside `path/to/foo` can be listed with `ptf`
    * Project specific terms will be memoized automatically after a short time
* Press `<F5>` to reload the directory cache.
* Press `<C-f>` and `<C-b>` to cycle **f**orward and **b**ack between modes.
* Press `<C-d>` to switch to filename only search instead of full path.
* Press `<C-r>` to switch to **r**egexp mode.
* Press `<C-v>`, `<C-x>` to open the selected entry in a new **v**ertical/horizontal split.
* Press `<C-y>` to create a new file and its parent directories.
* Use `<C-j>`, `<C-k>` to navigate the result list.
* Use `<C-n>`, `<C-p>` to select the **n**ext/**p**revious string in the prompt's history.
* Use `<C-z>` to mark/unmark multiple files and `<C-o>` to **o**pen them.

Run `:help ctrlp-mappings` or submit `?` in [CtrlP][3] for more mapping help.

#### Working with split windows

Both [NERDTree][2] and [CtrlP][3] provide the following mappings to open the
currently selected file in a new split window.

* `<C-v>` to open the file under the cursor in a **v**ertical split
* `<C-x>` to open the file under the cursor in a horizontal split

To move the focus between splits, the following mappings are available

* `<C-h>` to **focus** the **buffer to the left** of the current buffer
* `<C-l>` to **focus** the **buffer to the right** of the current buffer
* `<C-j>` to **focus** the **buffer below** the current buffer
* `<C-k>` to **focus** the **buffer above** the current buffer

To resize split windows, the following mappings are available

* `<S-Up>` to **increase** the current **buffer height**
* `<S-Down>` to **decrease** the current **buffer height**
* `<S-Left>` to **decrease** the current **buffer width**
* `<S-Right>` to **increase** the current **buffer width**

### Moving around in normal mode

Normal mode can be entered by pressing `<ESC>` in any other mode. Additionally,
`jj` or `jk` will activate normal mode when pressed in insert mode.

* `j/k` to move down/up a line
    * `Nj`/`Nk` to move down/up `N` number of lines (`5j` to move down 5 lines)
        * By default, line numbers are displayed relative to the current line
        * Use this relative distance to quickly determine the value for `N`
        * `<leader>n` to toggle between *absolute* and *relative* line numbering
* `gg` to move to the first line
* `G` to move to the last line
* `:N<CR>` to move to line `N` (`:10` followed by `<CR>` to move to line 10)

Yanking (copying) text in vim works by putting the yanked text into (various)
different registers. In the current configuration, the default register is not
shared with the system clipboard. This means that text yanked in vim using `y`
cannot be pasted into other apps using `<C-v>`, just as text copied in other
apps using `<C-c>` cannot be pasted into vim using `p`. Instead, `,y` and `,p`
can be used to copy/paste text to/from the system clipboard.

* `y` to yank/copy the current selection inside vim
* `yy` to yank/copy the current line
* `yw` to yank from cursor to the end of the current word
* `y$` to yank from cursor to the end of the current line
* `x` to yank/delete the character under the cursor
* `p` to paste the most recently yanked text from inside vim
* `,y` to copy current line to system clipboard
* `,p`/`,P` to paste system clipboard content to line below/above

### Visual mode (selecting and manipulating lines of text)

To enter visual mode and select a block of lines

* `V` to select a line and enter visual mode
* `j/k` to add selected lines below/above (optionally prefixed by `N`)

Once visual mode is active, yanking commands such as `y` followed by a motion
and a `p`, can often be useful.

### Visual block mode (selecting and manipulating columns of text)

To enter visual block mode and select a block of columns spanning multiple lines

* `<C-v>` to enter visual block mode
* `h/l` to add selected columns to the left/right
* `j/k` to add extend the column selection to lines below/above

Once visual block mode is active

* Add text to the **left** of the selected visual block
    * `I` to *insert* text in front of the cursor
    * Insert text in insert mode
    * `<ESC>` to go back to normal mode.
    * The inserted text will be prepended to all selected lines.
* Add text to the **right** of the selected visual block
    * `A` to *append* text after the cursor
    * Append text in insert mode
    * `<ESC>` to go back to normal mode.
    * The inserted text will be appended to all selected lines.
* Change the selected visual block of text
    * `c` to *change* selected text (text will be deleted and yanked)
    * Enter replacement text in insert mode
    * `<ESC>` to go back to normal mode.
    * The inserted text will replace the previous text on all lines.
* Replace the selected visual block of text with a single character
    * `r` to *replace* selected text
    * Enter the replacement character
    * Useful e.g. for "deleting" a column of `,` by replacing it with `<Space>`

## Manipulating files

* `:e` followed by a path to **e**dit the file in the currently active buffer
* `:r` followed by a path to **r**ead/**r**eload file into the current buffer
* `<leader>w` to **w**rite to a file (e.g. save the file). Alternatively `:w`
* `:q` to **q**uit (close) the currently active buffer
* `:wq` to **w**rite (save) and **q**uit the currently active buffer
* `<leader>m` to rename the file in the currently active buffer

### Manipulating text

All commands are started in normal or visual mode. All text modifications support
*undo* and *redo* functionality.

* `u/U` to undo/redo the previous action
* `<leader>u` to open [undotree][5] and revert to any previous state
    * `?` to display inline help for using [undotree][5]
    * `D` on an entry to show the diff between now and then
    * `q` to close [undotree][5]

Use `.` to repeat the last command

* Almost all vim commands can be repeated with `.`
* Play around with this! This is easily one of the most powerful commands

### Navigating text

* `h` to move the cursor one character to the left
* `l` to move the cursor one character to the right
* `k` to move the cursor up one line
* `j` to move the cursor down one line
* `w` to move the cursor one **w**ord forward
* `b` to move the cursor one word **b**ackward
* `{N}gi•text` Start **i**nsert mode at the last insertion point
    * [ repeat `text` `N` times when leaving insert mode ]
* `^<Space>` to move to a line's first non-blank character in normal/visual mode
* `f` *x* to **f**ind the next occurrence of *x*
* `/` or `?` *pattern*`<CR>` to forward/backward search and highlight *pattern*
    * `n/p` to jump to the **n**ext/**p**revious occurrence
    * `<leader>/` to toggle highlighting of search results
* `<leader>a` to search for files using [ack][4]
* `<leader>e` to quickly jump to any "end of word"
* `m•{a-zA-Z}` to set a mark, e.g `ma` to set mark `a`
* `'•{a-zA-Z}` jump to mark, e.g. `'a` to jump to mark `a`
* `<leader>fc` to find conflict markers

### Inserting and changing text

Almost all insertion commands can be repeated with the `.` command. There are
ways to allow vim to repeat *every* command using the `.`, but these involve
manual configuration in `~/.vimrc` and aren't covered here.

#### Commands that start insert mode

* `{N}i•text` **i**nsert `text` `N` times before the cursor
* `{N}a•text` **a**ppend `text` `N` times after the cursor
* `{N}I•text` **I**nsert `text` `N` times, starting at current line's first non-blank character
* `{N}A•text` **A**ppend text `N` times to the end of the current line
* `{N}gI•text` **I**nsert `text` `N` times, starting at column 1 of the current line
* `{N}o`,`{N}O` `•text` insert `text` on `N` new lines below/above the cursor
* `{N}cw•text` **c**hange the next `N` **w**ords at the cursor to `text`
    * short for, `{N}caw` (**c**hange **a**round **w**ord)
        * change the next `N` words (including word boundary character(s))
* `ciw•text` **c**hange **i**nner **w**ord to `text` (until the first word boundary character)
* `ct•x•text` **c**hange to `text` un**t**il the first occurrence of `x`

#### Commands that start visual mode

Press `v` to start **v**isual mode. Once activated, the following motions help
to extend the selection to cover the desired range of characters.

* `{N}e` extend the selection to the **e**nd of the `N`th word after the cursor
* `{N}w` extend the selection to the beginning of the `N`th **w**ord after the cursor
* `{N}b` reduce the selection **b**ack to the **b**eginning of the `N`th word before the cursor
* `{N}ge` reduce the selection back to the **e**nd of the `N`th word before the cursor
* `iw` extend the selection to the **i**nner **w**ord
    * select until (but excluding) the first word boundary character
    * press `w` motion multiple times to keep on selecting further words
    * press `b` motion multiple times to deselect words **b**ackwards
* `aw` extend the selection **a**round the **w**ord
    * select until the next word (including word boundary character(s))
    * press `w` multiple times to keep on selecting further **w**ords
    * press `b` multiple times to deselect words **b**ackwards
* `ip` extend the selection to the **i**nner **p**aragraph
    * select consecutive lines ending the selection at the end of the last line
    * `:norm A•text•<CR>` to **a**ppend `text` to every line in the selection
    * `<C-v>$A•text•<ESC>` to **a**ppend `text` to every line in the rectangular selection
    * `ga*•c•<CR>` to **a**lign selection at all occurrences of `c`
    * `ga*•<C-x>regex•<CR>` to **a**lign selection at all matches of `regex`
* `ap` extend the selection **a**round the **p**aragraph
    * select consecutive lines ending the selection at the start of the following line
* `i"`,`i'`,`i`\` extend the selection to everything **i**nside (but excluding) `"`,`'`,\`
* `i(`,`i)` extend the selection to everything **i**nside (but excluding) `()`
* `i[`,`i]` extend the selection to everything **i**nside (but excluding) `[]`
* `i{`,`i}`,`iB` extend the selection to everything **i**nside (but excluding) `{}`
* `i<`,`i>` extend the selection to everything **i**nside (but excluding) `<>`
* `a"`,`a'`,`a`\` extend the selection to everything **a**round and including `"`,`'`,\`
* `a(`,`a)` extend the selection to everything **a**round and including `()`
* `a[`,`a]` extend the selection to everything **a**round and including `[]`
* `a{`,`a}`,`aB` extend the selection to everything **a**round and including `{}`
* `a<`,`a>` extend the selection to everything **a**round and including `[]`

Once all the desired text is selected (and optionally manipulated), continue with

* starting insert mode to edit the selected text
    * e.g. `vip•c•word` to **c**hange text in all consecutive selected lines to `word`
* manipulate the visual selection some more
    * e.g. `vipga*=` to **a**lign all consecutive selected lines at all occurrences of `=`
    * e.g. `viw2eS)` anywhere in `hello` of `hello world` to change to `(hello world)`

#### Commands that don't start insert mode

* `{N}go`,`{N}gO` add `N` new lines below/above without entering insert mode
* `{N}p`,`{N}P` paste `N` times below/above the cursor
* `{N}r•c` **r**eplace `N` characters starting at cursor with `c`
* `{N}J` **J**oin `N` lines by replacing the linebreak with `<Space>`
* `{N}gJ` **J**oin `N` lines by removing the linebreak
* `cs`*ab* to **c**hange the characters **s**urrounding the current word from *a* to *b*
    * with the cursor inside `"foo"`, use `cs"'` to change to `'foo'`
* `ds`*d* to remove the surrounding character *d*
    * with the cursor inside `"foo"`, use `ds"` to change to `foo`
* `ys`*Nwd* to **s**urround the next `N` `w`ords with *d*
    * with the cursor at `h` in `hello`, use `ysiw"` to change to `"hello"`
    * with the cursor at `h` in `hello world`, use `ys2w"` to change to `"hello world"`
    * somewhere on a line, use `yss"` to **s**urround the complete line with `"`
* `{N}vu` to change `N` characters to lowercase
* `{N}vU` to change `N` characters to **u**ppercase
* `gS` to **s**plit a one-liner into multiple lines (works in a lot of languages)
* `gJ` to **j**oin a block into a single-line statement (works in a lot of languages)
    * the cursor must be on the first line of a block
* `:%s/replace/with/g` to replace all occurences of `replace` with `with`
* `<leader>bl` to toggle ruby blocks from `{}` to `do/end` and vice versa
* `{visual}<leader>ul` to underline the current line with `-`
* `{visual}<leader>uul` to underline the current line with `=`
* `{visual}<leader>cul` to surround the current line with `-`
* `{visual}<leader>c<SPACE>` to (un)comment (selected) code
* `{VISUAL}<leader>t=` to align selection at `=` (e.g. ruby assignments)
* `{VISUAL}<leader>t>` to align selection at `>` (e.g. ruby hash literals)
* `{VISUAL}<leader>t:` to align selection at `:` (e.g. modern ruby hash literals)
* `{VISUAL}<leader>ll` to align blocks of `let` statements in specs at `/[{}]/`

### Deleting text

All deleted text will be yanked automatically and thus be available via `p/P`.
Deletion commands can be repeated with the `.` command. Some of them might
behave in unexpected ways when repeated at another cursor position though.

* `x` to delete character
* `dw` to **d**elete from cursor until the next **w**ord
* `db` to **d**elete from cursor back to the beginning of **w**ord
* `dd` to **d**elete the current line
* `D` to **d**elete to end of line
* `{visual}x` to delete selected character under cursor
* `d^<Space>` **d**elete to beginning of line
* `{N}dt•x` **d**elete all characters un**t**il the first `x`
* `{N}diw` **d**elete `N` **i**nner **w**ords
* `{N}daw` **d**elete `N` words
* `{N}dgn` **d**elete the `N` **n**ext search pattern matches
* `{N}dip` **d**elete `N` **i**nner **p**aragraphs
* `{N}dap` **d**elete `N` **p**aragraphs
* `dib` **d**elete **i**nner `(` `)` **b**lock
* `dab` **d**elete **a** `(` `)` **b**lock
* `diB` **d**elete **i**nner `{` `}` **b**lock
* `daB` **d**elete **a** `{` `}` **b**lock
* `<leader><Space>` to delete trailing whitespace on the current line

## Working with git

The [fugitive][6] and [vimagit][7] plugins make it easy to perform everyday
git operations like *(un)staging* files/hunks/lines and *comitting* changesets.

* `:GBlame` to get an idea of who edited what and when
    * `j/k` to move down/up lines in the blame view
    * `~` to reblame at the currently selected line
* Perform a commit
    1. `<leader>gs` to see git status
    1. `-` to (un)stage files
    1. `CC` to edit commit message
    1. `:wq` to commit
* Amend the previous commit
    1. `<leader>ga`


[1]: https://github.com/snusnu/dotfiles       "snusnu/dotfiles"
[2]: https://github.com/scrooloose/nerdtree   "NERDTree"
[3]: https://github.com/ctrlpvim/ctrlp.vim    "CtrlP"
[4]: https://github.com/mileszs/ack.vim       "ack"
[5]: https://github.com/mbbill/undotree       "undotree"
[6]: https://github.com/vim-fugitive/fugitive "fugitive"
[7]: https://github.com/jreybert/vimagit      "vimagit"

[8]: https://github.com/snusnu/dotfiles/blob/master/vimrc "vimrc"
