"-------------------- Plugin Settings -------------------- {{

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.dotfiles/nvim/init.vim
endif

call plug#begin('~/.vim/plugged')

Plug 'maxmellon/vim-jsx-pretty'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'tpope/vim-commentary'
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
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'hoob3rt/lualine.nvim'
  Plug 'L3MON4D3/LuaSnip'
  Plug 'preservim/nerdtree'
  Plug 'lewis6991/impatient.nvim' 
  Plug 'glepnir/dashboard-nvim'
  Plug 'ryanoasis/vim-devicons'
  " Plug 'huyvohcmc/atlas.vim'
endif

call plug#end()

"}}


