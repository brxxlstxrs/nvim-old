local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])


return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'lewis6991/impatient.nvim'

  -- mason
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  }

  -- LSP
  use {
    'neovim/nvim-lspconfig',
    config = function()
      require('config.lsp')
    end,
  }

  -- null-ls
  use {
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      require('config.null-ls')
    end,
    requires = "nvim-lua/plenary.nvim",
  }

  -- snippets
  use {
    'L3MON4D3/LuaSnip',
    requires = {
      "rafamadriz/friendly-snippets", 
      'saadparwaiz1/cmp_luasnip',
    }
  }

  -- autocopletition
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use {
    'hrsh7th/nvim-cmp',
    config = function()
      require('config.cmp')
    end,
    requires = {
      {'nvim-tree/nvim-web-devicons'},
      {"windwp/nvim-autopairs",
  --[[{]]  config = function() -- }
  --[[{]]    require("nvim-autopairs").setup {} -- }
  --[[{]]  end, },
      {'onsails/lspkind.nvim'},
    },
  }

  -- code highligting
  use {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('config.treesitter')
    end,
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }
  
  -- cpp tools
  use 'ranjithshegde/ccls.nvim'
  use 'p00f/clangd_extensions.nvim'

  -- statusline
  use {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('config.lualine')
    end,
  }

  -- highlight indent level
  use "lukas-reineke/indent-blankline.nvim"

  -- commenting
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end,
  }
  
  -- other plugins
  use 'dstein64/vim-startuptime'

  -- colorscheme
  use 'rmehri01/onenord.nvim'
  use 'gbprod/nord.nvim'
  use { "ellisonleao/gruvbox.nvim" }


  if packer_bootstrap then
    require('packer').sync()
  end
end)
