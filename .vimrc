let mapleader = "\<Space>"

call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'tjdevries/colorbuddy.nvim', { 'branch': 'dev' }
Plug 'jesseleite/nvim-noirbuddy'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'moll/vim-bbye'
call plug#end()

set number

" Other notable themes:
" Plug 'https://git.sr.ht/~jbauer/vim-monochrome'
" Plug 'owickstrom/vim-colors-paramount'

" Configure how the colorscheme/theme looks
" set background=light
" lua require('noirbuddy').setup{colors={secondary='#3F497F', background='#FFFFFF', noir_0='#212121', noir_1='#323232', noir_2='#535353', noir_3='#737373', noir_4='#403e3e', noir_5='#a7a7a7', noir_6='#b4b4b4', noir_7='#4D4D4D', noir_8='#146C94', noir_9='#ffffff'}}
lua require('noirbuddy').setup{colors={secondary='#3F497F', background='#f6f3f7', noir_0='#212121', noir_1='#323232', noir_2='#535353', noir_3='#737373', noir_4='#434242', noir_5='#474E68', noir_6='#b4b4b4', noir_7='#a7a7a7', noir_8='#146C94', noir_9='#ffffff'}}


let g:lightline = {
      \ 'colorscheme': 'one',
      \ }

" Use system clipboard
set clipboard=unnamed

set hlsearch

" Make mouse work inside
set mouse=a
set mousemodel=popup_setpos

noremap <leader><leader>r :source ~/.vimrc<CR>

" don't deselect after indenting code using > or <
vnoremap < <gv
vnoremap > >gv

" Navigate tabs
noremap <leader>n :tabnew<CR>
noremap <leader>d :tabclose<CR>
noremap <leader>wn :tabnext<CR>
noremap <leader>wp :tabprevious<CR>

" Navigate buffers
noremap <leader><Tab> <C-^><CR>
noremap <leader>bn <C-o><CR>
noremap <leader>bp <C-i><CR>
noremap <leader>bw :Buffers<CR>
noremap <leader>bd :Bwipeout<CR>

noremap <leader>w :w<CR>
noremap <leader>q :q<CR>

" NERDTree config
map <leader>t :NERDTreeToggle<CR>
nnoremap <leader>p :GitFiles<CR>
nnoremap <silent> <Leader>f :Rg<CR>

" If opening a directory, open NERDTree automatically
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" Close Tree if the only buffer remaining
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Press <ESC> twice to remove search highlights
noremap <silent> <ESC><ESC> <ESC>:nohlsearch<CR><ESC>

" Use <ESC> to switch to normal mode in :terminal
tnoremap <Esc> <C-\><C-n>

if has('mouse_sgr')
        set ttymouse=sgr
endif

" alt+Q word wrap from emacs
vmap Q gq
nmap Q gqap
