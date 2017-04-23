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

"netrw folder explorer""""""""""""
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:netrw_list_hide= '\.git/$,^\.DS_Store$'

augroup ProjectDrawer
	autocmd!
	autocmd VimEnter * :Vexplore
augroup END
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

:cd ~/Documents/Code
