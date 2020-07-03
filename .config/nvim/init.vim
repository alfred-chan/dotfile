" Set enviroment
"se guifont=Courier:h10:cANSI
se tabstop=4
se shiftwidth=2
se ic
se relativenumber
se nu " show line number
se is
se autoindent
se laststatus=2
se encoding=utf-8
se laststatus=2  " always a status line
se cursorline
se paste
se t_ut=

se mouse-=a

:filetype plugin on

set t_Co=256


" vim-plug stuff
call plug#begin('~/.config/nvim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'
Plug 'benmills/vimux'
Plug 'dietsche/vim-lastplace'
Plug 'micha/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()
" vim-plug end

" For solarized color schema
let g:solarized_termcolors=256
se background=dark

"colo solarized
colo gruvbox
"colo desert 

highlight LineNr term=underline ctermfg=8 guifg=tan guibg=grey30

" Map leader to space
let mapleader = "\<Space>"


"for Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'

" old vim-powerline symbols
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif 
  " Format XML file by xmllint
  map <silent> <F6> :%!xmllint.exe --format -<CR>

" Jump to particular tab directly
"NORMAL mode bindings for gvim
noremap <unique> <M-1> 1gt
noremap <unique> <M-2> 2gt
noremap <unique> <M-3> 3gt
noremap <unique> <M-4> 4gt
noremap <unique> <M-5> 5gt
noremap <unique> <M-6> 6gt
noremap <unique> <M-7> 7gt
noremap <unique> <M-8> 8gt
noremap <unique> <M-9> 9gt
noremap <unique> <M-0> 10gt

"INSERT mode bindings for gvim
inoremap <unique> <M-1> <C-O>1gt
inoremap <unique> <M-2> <C-O>2gt
inoremap <unique> <M-3> <C-O>3gt
inoremap <unique> <M-4> <C-O>4gt
inoremap <unique> <M-5> <C-O>5gt
inoremap <unique> <M-6> <C-O>6gt
inoremap <unique> <M-7> <C-O>7gt
inoremap <unique> <M-8> <C-O>8gt
inoremap <unique> <M-9> <C-O>9gt
inoremap <unique> <M-0> <C-O>10gt

" Quickly open/reload vim
nnoremap <leader>ev :tabe $MYVIMRC<CR>  
nnoremap <leader>sv :source $MYVIMRC<CR> 

" key map for fzf
nnoremap <C-P> :Files<CR>
nnoremap <C-E> :Windows<CR>
inoremap <C-E> <ESC>:Windows<CR>

" key map for NerdTree
nnoremap <C-n> :NERDTreeToggle<CR> 

" Vimux Stuff Start
 function! VimuxSlime()
  call VimuxSendText(@v)
  call VimuxSendKeys("Enter")
 endfunction

 " Open pane for vimux
 nnoremap <leader>vo :call VimuxOpenRunner()<CR> 

 " If text is selected, save it in the v buffer and send that buffer it to tmux
 vmap <leader>vs "vy :call VimuxSlime()<CR>

 " Select current paragraph and send it to tmux
 nmap <leader>vs vip<Leader>vs<CR>

" Vimux Stuff end

" Hack in VIM WSL
" copy (write) highlighted text to .vimbuffer
vmap <C-c> y:new ~/.vimbuffer<CR>VGp:x<CR> \| :!cat ~/.vimbuffer \| clip.exe <CR><CR>
" paste from buffer
map <C-v> :r ~/.vimbuffer<CR>

