return {
  { 'folke/tokyonight.nvim' },
  { 'bluz71/vim-moonfly-colors', name = 'moonfly', lazy = false, priority = 1000 },
  { 'datsfilipe/vesper.nvim' },
  { 'kdheepak/monochrome.nvim' },
  {
    'rebelot/kanagawa.nvim',
    config = function()
      vim.cmd.colorscheme 'kanagawa'
    end,
  },
  { 'mcauley-penney/techbase.nvim' },
}
