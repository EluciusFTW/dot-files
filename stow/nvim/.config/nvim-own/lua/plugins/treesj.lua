return {
  'Wansmer/treesj',
  -- Todo: Remove these additional keybinds
  keys = { '<space>m', '<space>j', '<space>s' },
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    require('treesj').setup {}
  end,
}
