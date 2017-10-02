execute pathogen#infect()

filetype plugin indent on

syntax enable
colorscheme ryan_dark

let mapleader=","
:set backspace=2
:set tabstop=4
:set softtabstop=4
:set shiftwidth=4
:set noexpandtab
:set nowrap
:set mouse=a
:set ttymouse=xterm2
:set number
:set clipboard=unnamed
:set encoding=utf8
:set guifont=Inconsolata\ for\ Powerline\ Nerd\ Font\ Complete:h18
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//

"nerdtree folder explorer""""""""""""
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.\.$', '\.$', '\~$', '.DS_Store', '.git', '.idea']

map <C-n> :NERDTreeToggle<CR>
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
"""""""""""""""""""""""""""""""""

map <C-f> :BetterSearchPromptOn<CR>
map <C-x> :BW<CR>

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='luna'

nnoremap <leader>b :ls<cr>:b<space>

autocmd BufNewFile,BufRead *.json set ft=javascript

" Hightlight any extraneous white space at the end of lines
highlight ExtraWhitespace ctermbg=red guibg=Brown
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\S\zs\s\+$/
au InsertEnter * match ExtraWhitespace /\S\zs\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\S\zs\s\+$/
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ALE linting """""""""""""""""""""""""""""""""""""""""""""
let g:ale_open_list = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
