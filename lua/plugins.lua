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
  
  -- LSP
  {
    "neovim/nvim-lspconfig",
    config = function()
      require('config.lsp')
    end,
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'ranjithshegde/ccls.nvim',
      'p00f/clangd_extensions.nvim',
    },
  },

  -- autopairs
  'windwp/nvim-autopairs',

  -- snippets
  {
    'L3MON4D3/LuaSnip',
    dependencies = {
      "rafamadriz/friendly-snippets",
      'saadparwaiz1/cmp_luasnip',
    },
  },

  -- autocompletition
  {
    "hrsh7th/nvim-cmp",
    config = function()
      require("config.cmp")
    end,
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'onsails/lspkind.nvim',
    },
  },

  -- treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
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

  -- commenting
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  },

  'dstein64/vim-startuptime',

  -- colorscheme
  "rmehri01/onenord.nvim",
}

local opts = {
  install = {
    colorscheme = { "onenord" },
  },
}

require("lazy").setup(plugins, opts)
