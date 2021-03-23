"-------------------- Plugin Settings -------------------- {{

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.dotfiles/nvim/init.vim
endif

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'preservim/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
" Plug 'tpope/vim-vinegar'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
" Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'mhinz/vim-signify'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'sheerun/vim-polyglot'
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
Plug 'enricobacis/vim-airline-clock'
" Plug 'hail2u/vim-css3-syntax'
" Plug 'dense-analysis/ale'
Plug 'pacha/vem-tabline'
Plug 'bluz71/vim-nightfly-guicolors'

let g:coc_global_extensions = ['coc-json', 'coc-tsserver', 'coc-emmet', 'coc-eslint', 'coc-prettier', 'coc-snippets', 'coc-css', 'coc-html', 'coc-yaml']

call plug#end()

"}}


