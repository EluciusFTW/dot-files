return {
  'mpas/marp-nvim',
  keys = {
    {
      '<leader>MT',
      function()
        require('marp').toggle()
      end,
      mode = 'n',
      desc = 'Toggle Marp Preview',
    },
    {
      '<leader>MS',
      function()
        require('marp').status()
      end,
      mode = 'n',
      desc = 'Show Marp Status',
    },
  },
}
