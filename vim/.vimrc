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
:set number
:set clipboard=unnamed
:set encoding=utf8
:set guifont=Inconsolata\ for\ Powerline\ Nerd\ Font\ Complete:h18
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//

autocmd vimenter * NERDTree
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.\.$', '\.$', '\~$', '.DS_Store', '.git', '.idea']

let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_check_on_open = 1

map <C-f> :BetterSearchPromptOn<CR>
map <C-x> :BW<CR>
map <C-n> :NERDTreeToggle<CR>

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='luna'

nnoremap <leader>b :ls<cr>:b<space>

autocmd BufNewFile,BufRead *.json set ft=javascript
au BufNewFile,BufRead */templates/*.html set filetype=ejs

imap jj <esc>

highlight ExtraWhitespace ctermbg=red guibg=Brown
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\S\zs\s\+$/
au InsertEnter * match ExtraWhitespace /\S\zs\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\S\zs\s\+$/

autocmd CompleteDone * pclose

function s:find_jshintrc(dir)
    let l:found = globpath(a:dir, '.jshintrc')
    if filereadable(l:found)
        return l:found
    endif

    let l:parent = fnamemodify(a:dir, ':h')
    if l:parent != a:dir
        return s:find_jshintrc(l:parent)
    endif

    return "~/.jshintrc"
endfunction

function UpdateJsHintConf()
    let l:dir = expand('%:p:h')
    let l:jshintrc = s:find_jshintrc(l:dir)
    let g:syntastic_javascript_jshint_args = l:jshintrc
endfunction

au BufEnter * call UpdateJsHintConf()

let g:ctrlp_working_path_mode = 0

:cd ~/Documents/Code
