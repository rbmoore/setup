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

autocmd vimenter * NERDTree
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.\.$', '\.$', '\~$', '.DS_Store', '.git', '.idea']

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_check_on_open = 1

map <C-f> :BetterSearchPromptOn<CR>
map <C-x> :BW<CR>
map <C-n> :NERDTreeToggle<CR>

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='luna'

nnoremap <leader>b :ls<cr>:b<space>

autocmd BufNewFile,BufRead *.json set ft=javascript

imap jj <esc>

highlight ExtraWhitespace ctermbg=red guibg=Brown
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\S\zs\s\+$/
au InsertEnter * match ExtraWhitespace /\S\zs\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\S\zs\s\+$/

autocmd CompleteDone * pclose

function s:find_eslintrc(dir)
    let l:found = globpath(a:dir, '.eslintrc')
    if filereadable(l:found)
        return l:found
    endif

    let l:parent = fnamemodify(a:dir, ':h')
    if l:parent != a:dir
        return s:find_eslintrc(l:parent)
    endif

    return "~/.eslintrc"
endfunction

function UpdateEslintConf()
    let l:dir = expand('%:p:h')
    let l:eslintrc = s:find_eslintrc(l:dir)
    let g:syntastic_javascript_eslint_args = l:eslintrc
endfunction

au BufEnter * call UpdateEslintConf()

let g:ctrlp_working_path_mode = 0

:cd ~/Documents/Code
