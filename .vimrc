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
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround' " cs, ys, ds
Plug 'github/copilot.vim' " :Copilot
call plug#end()

set signcolumn=yes " always show sign column
set updatetime=100 " update gutter every 100ms (default 4000)

set number " show line number at cursor
set relativenumber " show relative line number around cursor

let g:netrw_liststyle=3 " show tree view
let g:netrw_browse_split=4 " open files in previous window
let g:netrw_winsize=15 " use 15% of screen when splitting
let g:netrw_banner=0 " hide netrw banner (use I to show)
let g:netrw_altv=1 " https://superuser.com/questions/1056929/open-file-in-vertical-split-in-vim-netrw

" sign column color to matches bg
highlight clear SignColumn
