local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

local plugins = {
  -- lazy
  "folke/lazy.nvim",

  -- impatient
  {
    "lewis6991/impatient.nvim",
    config = function()
      require("impatient")
    end,
  },
  
  -- LSP
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'ranjithshegde/ccls.nvim',
      'p00f/clangd_extensions.nvim',
    },
    config = function()
      require('config.lsp')
    end,
  },

  -- null-ls
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("config.null-ls")
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  -- autopairs
  {
    'windwp/nvim-autopairs',
    config = true,
  },

  -- snippets
  {
    'L3MON4D3/LuaSnip',
    dependencies = {
      'saadparwaiz1/cmp_luasnip',
      "rafamadriz/friendly-snippets",
    },
  },

  -- autocompletition
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'onsails/lspkind.nvim',
      'saadparwaiz1/cmp_luasnip',
    },
    config = function()
      require("config.cmp")
    end,
  },

  -- treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require("config.treesitter")
    end,
  },

  -- statusline
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require("config.lualine")
    end,
  },

  -- dirs overview
  {
    'nvim-tree/nvim-tree.lua',
    version = 'nightly',
  },

  -- highlight indent level
  "lukas-reineke/indent-blankline.nvim",

  {
    "folke/noice.nvim",
    config = function ()
      require("config.noice")
    end,
    dependencies = "MunifTanjim/nui.nvim",
  },

  -- commenting
  {
    'numToStr/Comment.nvim',
    config = true,
  },

  'dstein64/vim-startuptime',

  {'glepnir/dashboard-nvim'},
  {
    "folke/drop.nvim",
    event = "VimEnter",
    config = function()
      require("config.drop")
    end,
  },

  'eandrju/cellular-automaton.nvim',

  -- colorscheme
  "rmehri01/onenord.nvim",
}

local opts = {
  install = {
    colorscheme = { "onenord" },
  },
}

require("lazy").setup(plugins, opts)
