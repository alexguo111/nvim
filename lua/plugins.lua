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
  use 'neovim/nvim-lspconfig'
  use 'onsails/lspkind.nvim'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/nvim-cmp'
  -- use snip engine
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  -- auto pair and auto tag
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  -- telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use 'nvim-telescope/telescope-file-browser.nvim'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  -- devicons
  use 'nvim-tree/nvim-web-devicons'
  -- tab with bufferline
  use 'akinsho/bufferline.nvim'
  -- lspsaga
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
  })
  -- show git sign
  use 'lewis6991/gitsigns.nvim'
  -- use git command in neovim
  use 'dinhhuy258/git.nvim'
  -- use mason manager
  use "williamboman/mason.nvim"
  -- a bridge between mason and lspconfig
  use "williamboman/mason-lspconfig.nvim"
  use 'mfussenegger/nvim-dap'
end)
