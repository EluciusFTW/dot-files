return {
  { 'bluz71/vim-moonfly-colors' },
  { 'kdheepak/monochrome.nvim' },
  { 'oxidescheme/nvim' },
  {
    'rebelot/kanagawa.nvim',
    config = function()
      vim.cmd.colorscheme 'kanagawa'
    end,
  },
}
