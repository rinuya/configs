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
    
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'        -- package management
  use 'rebelot/kanagawa.nvim'         -- theme
  use 'nvim-tree/nvim-tree.lua'       -- tree
  use 'nvim-tree/nvim-web-devicons'   -- icons
  use 'nvim-lualine/lualine.nvim'     -- lualine
  use 'jiangmiao/auto-pairs'          -- auto brackets, 
  use 'neovim/nvim-lspconfig'         -- lsp
  -- formatting
  use {
    'stevearc/conform.nvim', 
    config = function() 
      require("conform").setup() 
    end,
  }        
  
  -- treesitter
  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
  }
  -- mason (managing lsp)
  use {
    'williamboman/mason.nvim',
    run = function() pcall(vim.cmd, 'MasonUpdate') end
  }
  use 'williamboman/mason-lspconfig.nvim'
  -- autocomplete
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {'williamboman/mason.nvim'},           -- Optional
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
    }
  } 
  
  -- telescope (finding stuff)
  use {
      'nvim-telescope/telescope.nvim',
      tag = '0.1.0',
      requires = { {'nvim-lua/plenary.nvim'} }
  }  
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
