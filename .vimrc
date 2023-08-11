" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin()
Plug 'tpope/vim-sleuth' " auto detect indent
Plug 'tpope/vim-surround' " cs, ys, ds
Plug 'github/copilot.vim' " :Copilot
Plug 'ap/vim-buftabline' " show buffers in tabline
call plug#end()

filetype plugin indent on " load plugins and indent settings for specific filetypes
syntax enable " enable syntax highlighting

" vim-sleuth will override these
set autoindent " auto indent
set tabstop=4 " tab width
set shiftwidth=4 " indent width
set expandtab " use spaces instead of tabs

set backspace=indent,eol,start " allow backspace in insert mode
set complete-=i " don't pollute completions

set smarttab " use tab for indenting in insert mode

set nrformats-=octal " don't treat numbers with leading 0 as octal

set incsearch " incremental search
set hlsearch " highlight search results
set smartcase " ignore case if search pattern is all lowercase
" use <C-L> to clear search highlight, from vim-sensible
if maparg('<C-L>', 'n') ==# ''
 nnoremap <silent> <C-L> :nohlsearch<C-R>'<Bar>diffupdate'
endif

set laststatus=2 " always show status bar
set ruler " always show ruler

set wildmenu " show completions in commandline with tab

set scrolloff=1 " show 1 line above/below cursor
set sidescrolloff=5 " show 5 columns left/right of cursor

set formatoptions+=j " remove comment when joining lines

set hidden " allow switching buffers without saving

set autoread " reload file if changed outside vim

set history=1000 " remember more history

set tabpagemax=100 " allow 100 tabs

set viminfo^=! " restore global vars with uppercase letters
set sessionoptions-=options " disable saving options
set viewoptions-=options " disable saving options

set display+=lastline " show last line of file:list

" enable undoing C-U and C-W
inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>

set signcolumn=yes " always show sign column
set updatetime=100 " update gutter every 100ms (default 4000)

set number " show line number at cursor
set relativenumber " show relative line number around cursor

set encoding=utf-8 " use utf-8 encoding

set conceallevel=2 " conceal characters

let g:netrw_liststyle=3 " show tree view
let g:netrw_browse_split=4 " open files in previous window
let g:netrw_winsize=15 " use 15% of screen when splitting
let g:netrw_banner=0 " hide netrw banner (use I to show)
let g:netrw_altv=1 " https://superuser.com/questions/1056929/open-file-in-vertical-split-in-vim-netrw

" show netrw help when pressing ?
autocmd FileType netrw nnoremap ? :help netrw-quickmap<CR> 

" sign column color to matches bg
highlight clear SignColumn

set undofile " save undo history

let g:copilot_filetypes = { '*': v:true } " enable copilot for all filetypes

" set colorscheme
set background=dark
colorscheme slate

" j and k move by screen line
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

" escape terminal mode
tnoremap <leader><Esc> <C-\><C-n>
