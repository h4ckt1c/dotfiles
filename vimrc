set t_Co=256
" highlight trailing whitespaces (must be before colorscheme)
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red 
autocmd InsertLeave * match ExtraWhitespace /\s\+$/

""" Settings for vimwiki:
"   See https://github.com/vimwiki/vimwiki
syntax on
filetype plugin on
set nocompatible

execute pathogen#infect()

colorscheme wombat256mod	" set colorscheme

highlight TabLine cterm=NONE ctermbg=blue ctermfg=white
highlight TabLineFill cterm=NONE ctermbg=grey

set number          " show line numbers
set tabstop=4       " tab -> 4 whitespaces
set expandtab       " insert 4 whitespaces on tab
set softtabstop=4   " remove 4 whitespaces on backspace if 'tab' is present
set smartindent     " keep indents on pressing enter
set shiftwidth=4    " shifting with < and > 4 whitespaces
set scrolloff=8     " begin scrolling when 8 lines before end-of-screen
set history=100     " increase history limit
set cmdheight=2     " increase cmd line to two
set wildmenu        " auto completion in command menu
set autochdir       " change directory when switching between tabs
set incsearch       " search as you type
set ignorecase      " ignore case when searching
set smartcase       " except case is given
set noswapfile      " Because I don't like it
<<<<<<< HEAD
set backspace=2     " Fix backspace problem in self compiled vim
=======
set undofile        " Prepare for persistent undo
set backspace=2     " Fix strange behaviour (unsetted bs) in custom compiled vim
>>>>>>> 49b85b9ba767947e36b2c8f5a70d761b5ede2369

set laststatus=2    " enable statusline always
set statusline=     " clear statusline
set stl+=%F         " add fullpath
set stl+=\ %y       " add recognized filetype
set stl+=\ %m       " add modified flag
set stl+=\ \ \ \    " a few spaces as seperator
set stl+=%{strftime('%H:%M')}
set stl+=\ \ \ \    " a few spaces as seperator
set stl+=Clipboard:\ %{strpart(@\",0,20)}
set stl+=\ \ \ \    " a few spaces as seperator
set stl+=Search:\ %{strpart(@\/,0,20)}
set stl+=%=\ %l/%L  " add row numbers
set stl+=%=\ 0x%02B " add ascii value of char

""" blowfish2 requires vim 7.4.399 or higher!
set cryptmethod=blowfish

""" general mappings
noremap H ^
noremap L $

""" mappings - insertmode
inoremap jk <Esc>l


""" mappings - normalmode
nnoremap . :
nnoremap <F5> ggg?G``
"nnoremap <C-t> :Texplore<CR>
nnoremap <Space> za
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>

""" mappings - visualmode
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
vnoremap <CR> y

""" keep folds when closing file
autocmd BufWinLeave *.{c,py,sh,html,php,css} mkview
autocmd BufWinEnter *.{c,py,sh,html,php,css} silent loadview

""" comment/uncomment stuff with , and ;
autocmd FileType python,sh,php  noremap <buffer> , :s /^/# /<CR>
autocmd FileType python,sh,php  noremap <buffer> ; :s /^# //<CR>
autocmd FileType vim            noremap <buffer> , :s /^/" /<CR>
autocmd FileType vim            noremap <buffer> ; :s /^" //<CR>
autocmd FileType html           noremap <buffer> , :s /^\(.*\)$/<!-- \1 -->/<CR>
autocmd FileType html           noremap <buffer> ; :s /^<!-- \(.*\) -->$/\1/<CR>
autocmd FileType css            noremap <buffer> , :s /^\(.*\)$/\/\* \1 \*\//<CR>
autocmd FileType css            noremap <buffer> ; :s /^\/\* \(.*\) \*\/$/\1/<CR>

""" execute files with F9
autocmd FileType python         noremap <F9> :!python2 %<CR>
autocmd FileType vim            noremap <F9> :source %<CR>
autocmd FileType sh             noremap <F9> :!bash %<CR>
autocmd FileType php            noremap <F9> :!php %<CR>

""" Esc -> (terminal)normal mode
tnoremap jk <C-w>N
tnoremap <Esc> <C-w>N

""" toggle filetype html/php with F8
autocmd FileType html,php       noremap <F8> :call ToggleFileType()<CR>

""" indent after keywords in python
autocmd FileType python         setlocal smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

function! ToggleFileType()
    if &filetype == 'html'
        set filetype=php
    else
        set filetype=html
    endif
endfunction

let g:calendar_google_calendar = 1
