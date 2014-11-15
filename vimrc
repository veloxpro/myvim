set nocompatible               " be iMproved

filetype off                   " required!

"<Leader> key is ,
"let mapleader=";"

" Vundle init
set rtp+=~/.vim/bundle/Vundle.vim

" Require Vundle
try
    call vundle#begin()
catch
    echohl Error | echo "Vundle is not installed. Run 'cd ~/.vim/ && git submodule init && git submodule update'" | echohl None
endtry

if exists(':Bundle')
    Bundle 'gmarik/vundle'

    " My Bundles here:
    "
    " repos on github
    Plugin 'scrooloose/nerdtree'
    Plugin 'jistr/vim-nerdtree-tabs'
    Plugin 'othree/html5.vim.git'
    Plugin 'majutsushi/tagbar.git'
    Plugin 'Lokaltog/vim-easymotion'
    Plugin 'bling/vim-airline'
    Plugin 'ervandew/supertab.git'
    Plugin 'kchmck/vim-coffee-script'
    Plugin 'kien/ctrlp.vim'
    Plugin 'scrooloose/syntastic.git'
    Plugin 'StanAngeloff/php.vim'
    "Bundle 'joonty/vim-phpqa.git'
    "Bundle 'joonty/vim-sauce.git'
    "Bundle 'joonty/vdebug.git'
    "Bundle 'joonty/vim-phpunitqf.git'
    "Bundle 'joonty/vim-taggatron.git'
    "Bundle 'tpope/vim-fugitive.git'
    "Bundle 'tpope/vim-markdown.git'
    "Bundle 'joonty/vim-tork.git'
    "Bundle 'rking/ag.vim'
    "Bundle 'SirVer/ultisnips.git'
end
call vundle#end()            " required

filetype plugin indent on     " required!
syntax enable
colorscheme elflord
runtime macros/matchit.vim
let g:EasyMotion_leader_key = '<Space>'

" Common mistypings
command! -nargs=* -complete=function Call exec 'call '.<f-args>
command! Q q
command! -bang Q q<bang>
command! Qall qall
command! -bang Qall qall<bang>
command! W w
command! -nargs=1 -complete=file E e <args>
command! -bang -nargs=1 -complete=file E e<bang> <args>
command! -nargs=1 -complete=tag Tag tag <args>

set ttyscroll=0
set hidden
set history=1000
set ruler
set ignorecase
set smartcase
set title
set scrolloff=3
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set wrapscan
set clipboard=unnamed
set visualbell
set backspace=indent,eol,start
"Status line coolness
set laststatus=2
set showcmd
" Search things
set hlsearch
set incsearch " ...dynamically as they are typed.
set listchars=tab:>-,trail:·,eol:$
" Folds
set foldmethod=marker
set wildmenu
set wildmode=list:longest,full
set mouse=a
set nohidden
set shortmess+=filmnrxoOt
set viewoptions=folds,options,cursor,unix,slash
set virtualedit=onemore
set shell=bash\ --login

"Spaces, not tabs
set shiftwidth=4
set tabstop=4
set expandtab

"Speed highlighting up
set nocursorcolumn
set nocursorline
syntax sync minlines=256

"Fugitive (Git) in status line
set statusline=%{exists(\"*fugitive#statusline\")?\"branch:\ \".fugitive#statusline():\"\"}\ %F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]

" Set font for GUI (e.g. GVim)
if has("gui_running")
    "set guifont=Anonymous\ Pro\ 13
endif

" Fast saving
nnoremap <Leader>w :w<CR>
vnoremap <Leader>w <Esc>:w<CR>
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>
vnoremap <C-s> <Esc>:w<CR>

nnoremap <Leader>x :x<CR>
vnoremap <Leader>x <Esc>:x<CR>

" Stop that damn ex mode
nnoremap Q <nop>

" Quick nohl
nnoremap <Leader>h :nohl<CR>

" Line number type toggle
nnoremap <Leader>l :call LineNumberToggle()<cr>

" CtrlP
nnoremap <Leader>t :CtrlP getcwd()<CR>
nnoremap <Leader>f :CtrlPClearAllCaches<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>j :CtrlP ~/<CR>
nnoremap <Leader>p :CtrlP<CR>

" Instead of 1 line, move 3 at a time
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Show hidden characters (spaces, tabs, etc)
nmap <silent> <leader>s :set nolist!<CR>

" PHPDoc commands
inoremap <C-d> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-d> :call PhpDocSingle()<CR>
vnoremap <C-d> :call PhpDocRange()<CR>

" Fugitive shortcuts
nnoremap <Leader>c :Gcommit -a<CR>i
nnoremap <Leader>g :Git
nnoremap <Leader>a :Git add %:p<CR>

" Quick insert mode exit
imap jk <Esc>

" Tree of nerd
nnoremap <Leader>n :NERDTreeToggle<CR>

" Show trailing white space
hi ExtraSpace ctermbg=red guibg=red
match ExtraSpace /\s\+$/
autocmd BufWinEnter * match ExtraSpace /\s\+$/
autocmd InsertEnter * match ExtraSpace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraSpace /\s\+$/
autocmd BufWinLeave * call clearmatches()
nnoremap <leader>z :%s/\s\+$//<cr>:let @/=''<CR>

let g:ctrlp_working_path_mode = 'ra'

" Tab completion - local
"let g:SuperTabDefaultCompletionType = "<c-x><c-p>"
let g:SuperTabDefaultCompletionType = "<c-n>"

let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_enable_balloons = 1
let g:syntastic_auto_loc_list=1
let g:syntastic_mode_map = { 'mode': 'active',
            \                   'active_filetypes' : ['php'],
            \                   'passive_filetypes' : [''] }


" for mac arrows to work
map ^[[A <up>
map ^[[B <down>
map ^[[C <right>
map ^[[D <left>

" notmal mode mappings

nmap <F3> /<C-R><C-W><CR>
nmap <F4> :TlistToggle<CR>
nmap <silent> <F6> :NERDTreeToggle<CR>
nmap <silent> <F1> :call ToggleTabDrag()<CR>
nmap <F8> :TagbarToggle<CR>
"nmap <F10> :! bash<CR>
"nmap <F12> :call CreateTags()<CR>

nmap <silent> <S-k> :wincmd k<CR>
nmap <silent> <S-j> :wincmd j<CR>
nmap <silent> <S-h> :wincmd h<CR>
nmap <silent> <S-l> :wincmd l<CR>
nmap <silent> <C-[> :call TabMove(-1)<CR>
nmap <silent> <C-]> :call TabMove(1)<CR>

set pastetoggle=<F12>

let tabDrag = 1
function! ToggleTabDrag()
    if g:tabDrag == 0
        nmap <silent> <C-h> :call TabMove(-1)<CR>
        nmap <silent> <C-l> :call TabMove(1)<CR>
        let g:tabDrag=1
    else
        nmap <silent> <C-h> :tabp<CR>
        nmap <silent> <C-l> :tabn<CR>
        let g:tabDrag=0
    endif
endfunction
:call ToggleTabDrag()

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

let Tlist_Use_Right_Window   = 1


:hi TabLineFill guifg=Black guibg=Black ctermfg=Black ctermbg=Black
":hi cursorLine cterm=NONE gui=NONE

let g:NERDTreeDirArrows=1
let g:nerdtree_tabs_open_on_gui_startup=1
let g:nerdtree_tabs_autoclose=1

set encoding=utf-8
setglobal fileencoding=utf-8


if has("gui_macvim") " OS X
    " Hides toolbar and scrollbars and File menu
    set guioptions=egt
    "set guifont=Monaco:h14
    set guifont=Monaco:h11
    "set noantialias
    set transparency=10

    " Swipe to move between bufers :D
    map <silent> <SwipeLeft> :call TabMove(-1)<CR>
    map <silent> <SwipeRight> :call TabMove(1)<CR>

    " Cmd+Shift+N = new buffer
    map <silent> <D-N> :enew<CR>

    " Cmd+t = new tab
    nnoremap <silent> <D-t> :tabnew<CR>

    " Cmd+w = close tab (this should happen by default)
    nnoremap <silent> <D-w> :tabclose<CR>

    " Cmd+1...9 = go to that tab
    map <silent> <D-1> 1gt
    map <silent> <D-2> 2gt
    map <silent> <D-3> 3gt
    map <silent> <D-4> 4gt
    map <silent> <D-5> 5gt
    map <silent> <D-6> 6gt
    map <silent> <D-7> 7gt
    map <silent> <D-8> 8gt
    map <silent> <D-9> 9gt

    " OS X probably has ctags in a weird place
    let g:tagbar_ctags_bin='/usr/local/bin/ctags'
endif

:set nowrap
:set number
