local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap =
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
  vim.cmd([[packadd packer.nvim]])
end

return require("packer").startup(function(use)
  -- Packer can manage itself
  use "wbthomason/packer.nvim"

  -- impatient (more speed)
  use "lewis6991/impatient.nvim"

  -- LSP
  use {
    "neovim/nvim-lspconfig",
    config = function()
      require("config.lsp")
    end,
  }

  -- Debug
  use {
    "mfussenegger/nvim-dap",
     config = function()
       require("config.dap")
     end,
  }
  use "mfussenegger/nvim-dap-python"
  use "theHamsta/nvim-dap-virtual-text"
  use "rcarriga/nvim-dap-ui"

  -- null-ls
  use {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("config.null-ls")
    end,
    requires = { "nvim-lua/plenary.nvim" },
  }

  -- cmp plugins
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use {
    "hrsh7th/nvim-cmp",
    config = function()
      require("config.cmp")
    end,
  }

  -- LuaSnip
  use "L3MON4D3/LuaSnip"
  use "saadparwaiz1/cmp_luasnip"
  use "rafamadriz/friendly-snippets"

  -- TreeSitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
    -- run = ':TSUpdate',
    config = function()
      require("config.treesitter")
    end,
    requires = {
      {"windwp/nvim-ts-autotag"},
      {'nvim-treesitter/nvim-treesitter-textobjects'},
      {"nvim-treesitter/nvim-treesitter-context", opt = true,},
    },
  }

  -- Completition icons
  use "onsails/lspkind.nvim"

  -- lualine
  use {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("config.lualine")
    end,
    requires = { "kyazdani42/nvim-web-devicons" },
  }

  -- A tree like view for symbols
  use "simrat39/symbols-outline.nvim"

  -- bufferline
  use {
    "akinsho/bufferline.nvim",
    tag = "v2.*",
    config = function()
      require("config.bufferline")
    end,
    requires = "kyazdani42/nvim-web-devicons",
  }


  -- autopairs
  use {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end,
  }

  -- Comment
  use {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  }

  -- nvim-tree
  use {
    "kyazdani42/nvim-tree.lua",
    config = function()
      require("config.nvim-tree")
    end,
    requires = {
      "kyazdani42/nvim-web-devicons", -- optional, for file icons
    },
    tag = "nightly",
  }

  -- indent blankline
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup({
        show_current_context = true,
      })
    end,
  }

  -- nvim surround
  use {
      "kylechui/nvim-surround",
      tag = "*", -- Use for stability; omit to use `main` branch for the latest features
      config = function()
        require("nvim-surround").setup()
      end,
  }

  -- Terminal from vim
  use {
    "akinsho/toggleterm.nvim",
    tag = "v2.*",
    config = function()
      require("config.toggleterm")
    end,
  }

  -- Startup time
  use "dstein64/vim-startuptime"

  -- Telescope
  use {
   "nvim-telescope/telescope.nvim",
   tag = "0.1.0",
   -- opt = true,
   config = function()
     require("config.telescope")
   end,
   requires = { { "nvim-lua/plenary.nvim" } },
  }
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
  use { "nvim-telescope/telescope-file-browser.nvim" }

  -- Git support
  -- use {
  --  "lewis6991/gitsigns.nvim",
  --  config = function()
  --    require("gitsigns").setup()
  --  end,
  --  opt = true,
  --  -- tag = 'release' -- To use the latest release
  -- }

  -- Colorschemes
  use { "catppuccin/nvim", as = "catppuccin" }
  use 'shaunsingh/nord.nvim'
  use "rebelot/kanagawa.nvim"
  use 'folke/tokyonight.nvim'

  if packer_bootstrap then
    require("packer").sync()
  end
end)

--[[
require('config.lsp')
require("config.null-ls")
require('config.cmp')
require('config.treesitter')
require('config.telescope')
require('config.lualine')
require('config.bufferline')
require("config.nvim-tree")
require('config.toggleterm')
]]
