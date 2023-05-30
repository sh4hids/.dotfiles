local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use('wbthomason/packer.nvim')
  use('sh4hids/color-wheel.vim')
  use({
    'olivercederborg/poimandres.nvim',
    config = function()
      require('poimandres').setup({
        -- leave this setup function empty for default config
        -- or refer to the configuration section
        -- for configuration options
        disable_background = true,
      })
    end,
  })

  use('neanias/everforest-nvim')
  use('nvim-tree/nvim-tree.lua')
  use('nvim-tree/nvim-web-devicons')
  use('nvim-lualine/lualine.nvim')
  use('nvim-treesitter/nvim-treesitter')
  use('nvim-treesitter/playground')
  use('hrsh7th/nvim-cmp')
  use('hrsh7th/cmp-nvim-lsp')
  use('hrsh7th/cmp-nvim-lua')
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-path')
  use('L3MON4D3/LuaSnip')
  use('saadparwaiz1/cmp_luasnip')
  use('rafamadriz/friendly-snippets')
  use('windwp/nvim-autopairs')
  use('lewis6991/gitsigns.nvim')
  use('tpope/vim-fugitive')
  use('numToStr/Comment.nvim')
  use('lukas-reineke/indent-blankline.nvim')
  use('akinsho/bufferline.nvim')
  use('nvim-lua/popup.nvim')
  use('nvim-lua/plenary.nvim')
  use('onsails/lspkind-nvim')
  use('jose-elias-alvarez/null-ls.nvim')
  use('jose-elias-alvarez/nvim-lsp-ts-utils')
  use('matbme/JABS.nvim')

  use({
    'goolord/alpha-nvim',
    -- requires = { 'nvim-tree/nvim-web-devicons' },
  })

  use({
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  })
  use({
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    requires = { { 'nvim-lua/plenary.nvim' } },
  })
  use({
    'akinsho/toggleterm.nvim',
    tag = '*',
  })

  use({
    'rrethy/vim-hexokinase',
    run = 'cd ~/.local/share/nvim/site/pack/packer/start/vim-hexokinase && make hexokinase',
  })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
