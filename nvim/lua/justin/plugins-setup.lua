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
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'

  -- nvim tree
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'

  -- pane nav
  use 'christoomey/vim-tmux-navigator'
  use 'szw/vim-maximizer'

  -- colors
  use 'catppuccin/nvim'

  -- status line
  use 'nvim-lualine/lualine.nvim'

  -- utilities
  use 'tpope/vim-surround'
  -- ys -> motion -> "" or () or etc...
  -- ds -> what it is
  -- cs -> motion -> what is is -> what to change to
  use 'numToStr/Comment.nvim'
  -- gcc to comment line
  -- gc -> motion to comment motion
  
  -- telescope
  use ({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use ({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })

  -- autocomplete
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path' 

  -- snippets
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'

  -- lsp
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'

  use 'hrsh7th/cmp-nvim-lsp'
  use({ "glepnir/lspsaga.nvim", branch = "main" })
  use 'jose-elias-alvarez/typescript.nvim'
  use 'onsails/lspkind.nvim'

  -- formatting
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'jayp0521/mason-null-ls.nvim'

  -- treesitter configuration
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  })
  
  use({ "windwp/nvim-autopairs", after = "nvim-treesitter" })
  use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })

  -- git
  use 'lewis6991/gitsigns.nvim'

  -- end of plugins
  --
  --

  if packer_bootstrap then
    require('packer').sync()
  end
end)
