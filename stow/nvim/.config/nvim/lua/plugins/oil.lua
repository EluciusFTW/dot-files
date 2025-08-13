return {
  "stevearc/oil.nvim",
  opts = {},
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  config = function()
    require("oil").setup({
      default_file_explorer = true,
      skip_confirm_for_simple_edits = true,
      view_options = {
        show_hidden = true,
        is_always_hidden = function(name, _)
          return name == ".." or name == ".git"
        end,
      },
    })
  end,
  keys = {
    {
      "<leader>e",
      "<cmd>Oil<CR>",
      desc = "Open Oil file explorer",
    },
    {
      "<leader>E",
      function()
        -- Save current (top) window before splitting
        local top_win = vim.api.nvim_get_current_win()

        -- Create bottom split and move into it
        vim.cmd("belowright split")

        -- Open Oil in bottom split, but edit files in top window
        require("oil").open(nil, {
          open_cmd = function(path)
            vim.api.nvim_set_current_win(top_win)
            vim.cmd.edit(path)
          end,
        })
      end,
      desc = "Open Oil in horizontal split below",
    },
  },
  view_options = {
    show_hidden = true,
  },
  lazy = false,
}
