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
vim.opt.rtp:prepend(lazypath)

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
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
		  "williamboman/mason-lspconfig.nvim",
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
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("config.null-ls")
    end,
    dependencies = {
      {"nvim-lua/plenary.nvim", lazy = true,},
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
    event = "InsertEnter",
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

  {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    cmd = 'Telescope',
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      require("config.telescope")
    end,
  },

  -- treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("config.treesitter")
    end,
  },

  -- statusline
  {
    'nvim-lualine/lualine.nvim',
    event = "VeryLazy",
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require("config.lualine")
    end,
  },

  -- dirs overview
  {
    'nvim-tree/nvim-tree.lua',
    cmd = "NvimTreeToggle",
    version = 'nightly',
    config = function()
      require("config.nvim-tree")
    end,
  },

  -- highlight indent level
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPost",
    config = true,
  },

  -- commenting
  {
    'numToStr/Comment.nvim',
    event = "VeryLazy",
    config = true,
  },

  {
    'dstein64/vim-startuptime',
    cmd = "StartupTime",
  },

  {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require("config.dashboard")
    end,
  },
  
  'eandrju/cellular-automaton.nvim',

  -- colorscheme
  {
    "rmehri01/onenord.nvim",
    lazy = true,
  },
}

local opts = {
  install = {
    colorscheme = { "onenord" },
  },
  rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
}

require("lazy").setup(plugins, opts)
