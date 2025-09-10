return {
  {
    'folke/tokyonight.nvim',
    -- config = function()
    --   ---@diagnostic disable-next-line: missing-fields
    --   require('tokyonight').setup {
    --     styles = {
    --       comments = { italic = true }, -- Disable italics in comments
    --     },
    --   }
    --   vim.cmd.colorscheme 'tokyonight-night'
    -- end,
  },
  { 'bluz71/vim-moonfly-colors', name = 'moonfly', lazy = false, priority = 1000 },
  { 'datsfilipe/vesper.nvim' },
  { 'kdheepak/monochrome.nvim' },
  {
    'mcauley-penney/techbase.nvim',
    priority = 1000,
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      -- require('techbase').setup {
      --   styles = {
      --     comments = { italic = true }, -- Disable italics in comments
      --   },
      -- }
      vim.cmd.colorscheme 'techbase'
    end,
  },
}
