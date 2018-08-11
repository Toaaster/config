syntax enable
filetype indent plugin on
set visualbell
set number
set ruler
set cursorline
set nostartofline
set wildmenu
set showcmd
set showmatch
set hlsearch
set incsearch
set shiftwidth=4
set expandtab
set tabstop=4
set softtabstop=4




"Keybindings
let mapleader = ","
map <C-b> :NERDTreeToggle<CR>
nnoremap <leader><space> :nohlsearch<CR>
nnoremap j gj
nnoremap k gk

" LaTeX (rubber) macro for compiling
nnoremap <leader>c :w<CR>:!rubber --pdf --warn all %<CR>

" View PDF macro; '%:r' is current file's root (base) name.
nnoremap <leader>v :!mupdf %:r.pdf &<CR><CR>

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif


"Plugins
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
"NERDTree
Plug 'scrooloose/nerdtree'
"neosnippet
Plug 'shougo/neocomplete'
Plug 'shougo/neocomplcache'
Plug 'shougo/neosnippet'
Plug 'shougo/neosnippet-snippets'
"Surround
Plug 'tpope/vim-surround'
"Silversearcher
Plug 'rking/ag.vim'
call plug#end()
"Polishing
"Close NERDTree if it is the only Window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
