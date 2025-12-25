return {
  'sindrets/diffview.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    {
      '<leader>gv',
      '<cmd>DiffviewOpen<CR> main',
      desc = 'Open Diffview',
    },
    { '<leader>gm', '<cmd>DiffviewOpen main<CR>', desc = 'Open Diffview vs main' },
  },
  opts = {
    keymaps = {
      view = {
        { 'n', '<leader>dc', '<cmd>DiffviewClose<CR>', { desc = 'Close Diffview' } },
      },
      file_panel = {
        { 'n', '<leader>dc', '<cmd>DiffviewClose<CR>', { desc = 'Close Diffview' } },
      },
      file_history_panel = {
        { 'n', '<leader>dc', '<cmd>DiffviewClose<CR>', { desc = 'Close Diffview' } },
      },
    },
  },
}
