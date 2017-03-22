set nocompatible              " be iMproved, required
filetype off                  " required
set conceallevel=0

set encoding=utf-8 "required for airline font

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')

" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" " The following are examples of different formats supported.
" " Keep Plugin commands between vundle#begin/end.
" " plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'Quramy/tsuquyomi'
Plugin 'leafgarland/typescript-vim'
Plugin 'tomasr/molokai'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'mattn/emmet-vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'vim-airline/vim-airline' 
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ternjs/tern_for_vim'
Plugin 'Shougo/vimproc.vim'

Plugin 'xolox/vim-session'
Plugin 'xolox/vim-misc'

Plugin 'airblade/vim-gitgutter'

Plugin 'Yggdroot/indentLine'
Plugin 'w0rp/ale'

Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

Plugin 'vim-syntastic/syntastic'

Plugin 'mileszs/ack.vim'


" " All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required

" " To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line

"THEMES
syntax enable
let g:rehash256 = 1
colorscheme molokai

"EDITOR
set number

if !exists("g:ycm_semantic_triggers")   
  let g:ycm_semantic_triggers = {} 
endif 

let g:ycm_semantic_triggers['typescript'] = ['.']

filetype plugin on 
set omnifunc=syntaxcomplete#Complete

inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
\ "\<lt>C-n>" :
\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

set backspace=indent,eol,start
set guifont=Inconsolata\ for\ Powerline:h10

" This allows buffers to be hidden if you've modified a buffer.
set hidden

" Tabs & Spaces
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=2
" when indenting with '>', use 4 spaces width
set shiftwidth=2
" On pressing tab, insert 4 spaces
set expandtab

" Move to the next buffer
nmap <C-Tab> :bnext<CR>

" Move to the previous buffer
nmap <C-S-Tab> :bprevious<CR>

"Folds
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=syntax   " fold based on indent level

"display absolute number (focus line) & relative number
set relativenumber 
set number

let g:session_directory='c:\users\eugenetsang\vim_sessions'
let g:session_autosave='yes'
let g:session_autoload='yes'

"airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='molokai'
set laststatus=2
set t_Co=25

" Start scrolling three lines before the horizontal window border
set scrolloff=5

" Show the (partial) command as it’s being typed
set showcmd

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction 

"vim syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"leader key mapping
let mapleader="\<Space>"

nnoremap <Leader>o :GFiles<CR>
nnoremap <Leader>s :OpenSession

let g:ackprg = 'ag --nogroup --nocolor --column'
for command in ['Ack', 'AckAdd', 'AckFromSearch', 'LAck', 'LAckAdd', 'AckFile', 'AckHelp', 'LAckHelp', 'AckWindow', 'LAckWindow']
  exe 'command ' . substitute(command, 'Ack', 'Ag', "") . ' ' . command
endfor

