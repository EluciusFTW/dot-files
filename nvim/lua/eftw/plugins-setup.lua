-- auto indtall packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
  return
end

return packer.startup(function(use)
  use("wbthomason/packer.nvim")
  use("nvim-lua/plenary.nvim") -- lua functions that many plugins use
  use("bluz71/vim-nightfly-guicolors") -- preferred colorscheme
  use("numToStr/Comment.nvim") -- commenting with gc
  use("nvim-tree/nvim-tree.lua") -- file explorer
  use("nvim-tree/nvim-web-devicons") -- vs-code like icons
  use("nvim-lualine/lualine.nvim") -- statusline
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder
  use('eandrju/cellular-automaton.nvim') 
  use("mbbill/undotree")
  
  -- Section containing all LSP stuff coplied fro mthe intro video, however, want to switch to lps-zero
  -- managing & installing lsp servers, linters & formatters
  -- use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
  -- use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig
  -- use("neovim/nvim-lspconfig") -- easily configure language servers
  -- use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
  -- use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
  -- use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
  -- use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion
  -- use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
  -- use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

  -- From Primagean
  -- ThePrimeagen/harpoon
  -- mbbill/undotree
  
  -- Own experiments
  use({
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  })
  -- use("epwalsh/obsidian.nvim")

  -- use("szw/vim-maximizer") -- maximizes and restores current window
  -- use("christoomey/vim-tmux-navigator") -- tmux & split window navigation
  -- essential plugins
  -- use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)
  -- use("inkarkat/vim-ReplaceWithRegister") -- replace with register contents using motion (gr + motion)

  -- fuzzy finding w/ telescope
  -- use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
  --use({
  -- "nvim-treesitter/nvim-treesitter",
  -- run = function()
  --  local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
  --ts_update()
  --end,
  --})
  -- use("nvim-treesitter")

  -- auto closing
  -- use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
  -- use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

  -- git integration
  -- use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

  if packer_bootstrap then
    require("packer").sync()
  end
end)
