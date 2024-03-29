return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  -- lsp config
  use 'neovim/nvim-lspconfig'
  -- lsp icons: method, function, etc
  use 'onsails/lspkind.nvim'
  -- lsp cmp to show completion suggestion
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  -- use snip engine
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }
  -- auto pair and auto tag
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  -- telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use 'nvim-telescope/telescope-file-browser.nvim'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  -- devicons
  use 'nvim-tree/nvim-web-devicons'
  -- tab with bufferline
  use 'akinsho/bufferline.nvim'
  -- show git sign
  use 'lewis6991/gitsigns.nvim'
  -- use git command in neovim
  use 'dinhhuy258/git.nvim'
  -- use mason manager
  use "williamboman/mason.nvim"
  -- a bridge between mason and lspconfig
  use "williamboman/mason-lspconfig.nvim"
  -- for debug
  use 'mfussenegger/nvim-dap'
  use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
  use 'folke/neodev.nvim'
  -- trouble
  use "folke/trouble.nvim"
  -- use null-ls as linter and formatter
  use "jose-elias-alvarez/null-ls.nvim"
end)
