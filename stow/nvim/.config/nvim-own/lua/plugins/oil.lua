return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type 'oil.SetupOpts'
  opts = {},
  dependencies = { { 'echasnovski/mini.icons', opts = {} } },
  config = function()
    require('oil').setup {
      default_file_explorer = true,
      skip_confirm_for_simple_edits = true,
      view_options = {
        show_hidden = true,
        is_always_hidden = function(name, _)
          return name == '..' or name == '.git'
        end,
      },
    }
  end,
  keys = {
    {
      '-',
      '<cmd>Oil<CR>',
      desc = 'Open Oil file explorer',
    },
    {
      '<leader>e',
      '<cmd>Oil --float<CR>',
      desc = 'Open Oil file explorer',
    },
  },
  view_options = {
    show_hidden = true,
  },
  lazy = false,
}
