" URL: http://vim.wikia.com/wiki/Example_vimrc
" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
" Description: A minimal, but feature rich, example .vimrc. If you are a
"              newbie, basing your first .vimrc on this file is a good choice.
"              If you're a more advanced user, building your own .vimrc based
"              on this file is still a good idea.

"------------------------------------------------------------
" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents.  Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Enable syntax highlighting
syntax on

colorscheme elflord
set background=dark
:set  t_Co=256


"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.

" One of the most important options to activate. Allows you to switch from an
" unsaved buffer without saving it first. Also allows you to keep an undo
" history for multiple files. Vim will complain if you try to quit without
" saving, and swap files will keep you safe if your computer crashes.
set hidden

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Modelines have historically been a source of security vulnerabilities.  As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline


"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
"set visualbell

" And reset the terminal code for the visual bell.  If visualbell is set, and
" this line is also included, vim will neither flash nor beep.  If visualbell
" is unset, this does nothing.
set t_vb=

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F12>


set go-=m
set go-=T

"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.

" Indentation settings for using 2 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

set encoding=utf-8
setglobal fileencoding=utf-8

"if has("gui_running")
"	colorscheme desert
"endif

"let g:NERDTreeDirArrows=1
let g:nerdtree_tabs_open_on_gui_startup=1
let g:nerdtree_tabs_autoclose=1

"set guifont=Monospace\ 11

function CreateTags()
"ctags-exuberant -f tags \
"	-h ".php" -R \
"	--PHP-kinds=cfiv \
"	--totals=yes \
"	--tag-relative=yes \
"	--PHP-kinds=cfiv \
"	--regex-PHP='/(abstract)?\s+class\s+([^ ]+)/\2/c/' \
"	--regex-PHP='/interface\s+([^ ]+)/\1/i/' \
"	--exclude="*.js" \
"	--exclude=".svn" \
"	--exclude=".git"
    let curNodePath = g:NERDTreeFileNode.GetSelected().path.str()
    exec ':!ctags -R --languages=php,javascript -f ' . curNodePath . '/tags ' . curNodePath
endfunction

" notmal mode mappings

nmap <F3> /<C-R><C-W><CR>
nmap <F4> :TlistToggle<CR>
nmap <F6> :NERDTreeTabsToggle<CR>
"nmap <F10> :! bash<CR>
"nmap <F12> :call CreateTags()<CR>

nmap <silent> <S-k> :wincmd k<CR>
nmap <silent> <S-j> :wincmd j<CR>
nmap <silent> <S-h> :wincmd h<CR>
nmap <silent> <S-l> :wincmd l<CR>

nmap <silent> <C-h> :tabp<CR>
nmap <silent> <C-l> :tabn<CR>

"map <C-S-h> :call TabMove(-1)<CR>
"map <C-S-l> :call TabMove(1)<CR>

:hi TabLineFill guifg=Black guibg=Black ctermfg=Black ctermbg=Black
":hi cursorLine cterm=NONE gui=NONE

" TagList config
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50

filetype plugin on
set ofu=syntaxcomplete#Complete

let Tlist_Use_Right_Window   = 1

let g:NERDTreeDirArrows=1

"let g:nerdtree_tabs_open_on_console_startup = 1

set backupdir=~/.vim/backup/
set directory=~/.vim/backup/

" :set mouse-=a
:set mouse=a

" Move current tab into the specified direction.
"
" @param direction -1 for left, 1 for right.
function! TabMove(direction)
    " get number of tab pages.
    let ntp=tabpagenr("$")
    " move tab, if necessary.
    if ntp > 1
        " get number of current tab page.
        let ctpn=tabpagenr()
        " move left.
        if a:direction < 0
            let index=((ctpn-1+ntp-1)%ntp)
        else
            let index=(ctpn%ntp)
        endif

        " move tab page.
        execute "tabmove ".index
    endif
endfunction

" comment/uncomment
function! CommentToggle()
    execute ':silent! s/\([^ ]\)/\/\/ \1/'
    execute ':silent! s/^\( *\)\/\/ \/\/ /\1/'
endfunction

map <F7> :call CommentToggle()<CR>

" compile on save
function LessToCss()
    let current_file = shellescape(expand('%:p'))
    let filename = shellescape(expand('%:r'))
    let command = "silent !lessc " . current_file . " " . filename . ".css"
    execute command
endfunction
autocmd BufWritePost,FileWritePost *.less call LessToCss()

" for mac arrows to work
map ^[[A <up>
map ^[[B <down>
map ^[[C <right>
map ^[[D <left>
