set t_Co=256 "colorfull terminal

" Set color schemes
colorscheme lucius

" Highglight current line
set cursorline!

"mapping leader key to comma (,) more accessible
let mapleader = ","

"source the (g)vimrc file after saving it
autocmd bufwritepost .vimrc source $MYVIMRC
autocmd bufwritepost .gvimrc source $MYGVIMRC

"edit (g)vimrc file with <leader>v
nmap <leader>v :tabedit $MYVIMRC<CR>
nmap <leader>gv :tabedit $MYGVIMRC<CR>
nmap <leader>s :tabedit ~/.vim/snippets<CR>

" Align assignments
vmap <leader>a :Tab /

"map :W to :w
"cmap W w

"allow backspacing over everything in insert mode
set backspace=indent,eol,start

"store :cmdline history
set history=1000

set showcmd   "show incomplete cmds down the bottom
set showmode  "show current mode down the bottom

set incsearch "find the next match as we type the search
" set hlsearch  "highlight searches by default

set number    "add line numbers
set showbreak=...
"set wrap linebreak nolist
set nowrap

"add some line space for easy reading
set linespace=2

"disable visual bell
set visualbell t_vb=

"statusline setup
set statusline=%f    "tail of the filename

"display a warning if fileformat isn't unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

"display a warning if file encoding isn't utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

set statusline+=%h                             "help file flag
set statusline+=\ %y                           "filetype
set statusline+=%r                             "read only flag
set statusline+=%m                             "modified flag
set statusline+=%{fugitive#statusline()}       "git status

set statusline+=%#warningmsg#
set statusline+=%*

"display a warning if &paste is set
set statusline+=%#error#
set statusline+=%{&paste?'[paste':''}
set statusline+=%*

set statusline+=%=                                  "left/right separator
set statusline+=%{StatuslineCurrentHighlight()}\ \  "current highlight
set statusline+=%c,                                 "cursor column
set statusline+=%l/%L                               "cursor line/total lines
"set statusline+=\ %P                                "percent through file
set laststatus=2

"return the syntax highlight group under the cursor ''
function! StatuslineCurrentHighlight()
    let name = synIDattr(synID(line('.'),col('.'),1),'name')
    if name == ''
        return ''
    else
        return '[' . name . ']'
    endif
endfunction

"indent settings
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
"per file type
autocmd FileType ruby,yaml,html,eruby,gitconfig,css setlocal shiftwidth=2 softtabstop=2
"autocmd FileType html       setlocal shiftwidth=4 softtabstop=4

au! BufRead,BufNewFile *.json setfiletype javascript

"folding settings
set foldmethod=indent     "fold based on indent
set foldnestmax=3         "deepest fold is 3 levels
set nofoldenable          "don't fold by default

set wildmode=list:longest    "make cmdline tab completion similar to bash
set wildmenu                 "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~,.DS_Store  "stuff to ignore when tab completing

set ignorecase "ignore case when searching
set smartcase

set title "set terminal title to the editing file

set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

"display tabs and trailing spaces
set listchars=tab:▸\ ,eol:¬
set list

" Strip trailing white spaces before file is saved
" function StripTrailingWhiteSpaces()
"   " Store the current position
"   let _s=@/
"   let l = line(".")
"   let c = col(".")
"   " Strip white spaces
"   %s/\s\+$//e
"   " Restore previous search history and cursor position
"   let @/=_s
"   call cursor(l, c)
" endfunction
" autocmd BufWritePre *.js,*.rb,*.html,*.mu,*.json,*.css,*.erb call StripTrailingWhiteSpaces()

nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

set formatoptions-=o "don't continue comments when pushing o/O

"vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

"necessary on some Linux distros for pathogen to properly load bundles
filetype off

"load pathogen managed plugins
call pathogen#runtime_append_all_bundles()

"load ftplugins and indent files
filetype plugin on
filetype indent on

"turn on syntax highlighting
syntax on

"some stuff to get the mouse going in term
set mouse=a
set ttymouse=xterm2

"hide buffers when not displayed
set hidden

"Command-T configuration
"let g:CommandTMaxHeight=10
"let g:CommandTMatchWindowAtTop=1

" keep selection after indent
vmap > >gv
vmap < <gv
vmap <Tab> >gv
vmap <S-Tab> <gv

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

" Switch to alternate file
map <C-Tab> :bnext<cr>
map <C-S-Tab> :bprevious<cr>

"make <c-l> clear the highlight as well as redraw
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>

"map to bufexplorer
nnoremap <leader>b :BufExplorer<cr>

"map NERDTreeToogle
nnoremap <leader>T :NERDTreeToggle<cr>

"map to CommandT TextMate style finder
"nnoremap <leader>t :CommandT<CR>

"map to FuzzyFinder
map <leader>O :FuzzyFinderTextMate<Enter>

"copy to system clipboard
vmap <leader>c y:call system("pbcopy", getreg("\""))<CR>

"map to TComment
map tt :TComment<CR>

"map rspec
map <leader>t :w\|!rspec %<CR>

"make Y consistent with C and D
nnoremap Y y$

"bindings for ragtag
inoremap <M-o>       <Esc>o
inoremap <C-j>       <Down>
let g:ragtag_global_maps = 1

"zencoding
let g:user_zen_expandabbr_key = '<C-e>'
let g:use_zen_complete_tag = 1
