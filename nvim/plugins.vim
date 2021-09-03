"-------------------- Plugin Settings -------------------- {{

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.dotfiles/nvim/init.vim
endif

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'preservim/nerdtree'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-commentary'
Plug 'enricobacis/vim-airline-clock'
Plug 'bluz71/vim-nightfly-guicolors'

if has("nvim")
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'neovim/nvim-lspconfig'
  Plug 'glepnir/lspsaga.nvim'
  Plug 'nvim-lua/completion-nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'folke/lsp-colors.nvim'
  Plug 'windwp/nvim-autopairs'
  Plug 'akinsho/bufferline.nvim'
  Plug 'lukas-reineke/indent-blankline.nvim'
endif

call plug#end()

"}}


