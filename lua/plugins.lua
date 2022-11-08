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
  use 'dstein64/vim-startuptime'

  -- LSP
  use {
    'neovim/nvim-lspconfig',
    config = function()
      require('config.lsp')
    end,
  }
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
      'nvim-tree/nvim-web-devicons',
      'onsails/lspkind.nvim',
      {"windwp/nvim-autopairs",
        config = function()
          require("nvim-autopairs").setup {}
        end  },
    },
  }

  -- null-ls
  use {
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      require('config.null-ls')
    end,
    requires = "nvim-lua/plenary.nvim"
  }

  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

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

  use {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('config.lualine')
    end,
  }

  use "lukas-reineke/indent-blankline.nvim"

  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }
  
  -- colorscheme
  use 'rmehri01/onenord.nvim'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
