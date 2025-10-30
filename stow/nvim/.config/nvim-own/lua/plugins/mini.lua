return { -- Collection of various small independent plugins/modules
  'echasnovski/mini.nvim',
  lazy = false,
  version = false,
  config = function()
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup { n_lines = 500 }

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require('mini.surround').setup()

    -- Simple and easy statusline.
    --  You could remove this setup call if you don't like it,
    --  and try some other statusline plugin
    local statusline = require 'mini.statusline'
    -- set use_icons to true if you have a Nerd Font
    statusline.setup {
      use_icons = vim.g.have_nerd_font,
      content = {
        active = function()
          local mode, mode_hl = MiniStatusline.section_mode { trunc_width = 120 }
          local filename = vim.fn.expand '%:t' -- just the file name
          local fileinfo = MiniStatusline.section_fileinfo { trunc_width = 1 }
          local location = MiniStatusline.section_location { trunc_width = 75 }

          -- Compose your custom statusline
          return MiniStatusline.combine_groups {
            { hl = mode_hl, strings = { mode } },
            { hl = 'MiniStatuslineFilename', strings = { filename } },
            '%=', -- End left alignment
            { hl = 'MiniStatuslineFileinfo', strings = { vim.bo.filetype } },
            { hl = 'MiniStatuslineLocation', strings = { location } },
          }
        end,
      },
    }

    -- You can configure sections in the statusline by overriding their
    -- default behavior. For example, here we set the section for
    -- cursor location to LINE:COLUMN
    ---@diagnostic disable-next-line: duplicate-set-field
    -- statusline.section_location = function()
    --   return '%2l:%-2v'
    -- end
    --
    -- ... and there is more!
    --  Check out: https://github.com/echasnovski/mini.nvim
  end,
}
