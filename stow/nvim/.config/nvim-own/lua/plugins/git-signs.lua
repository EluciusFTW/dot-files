return {
  'lewis6991/gitsigns.nvim',
  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
  },
  config = function(_, opts)
    require('gitsigns').setup(opts)
    local gs = require 'gitsigns'

    local actions = {
      ['Stage hunk'] = gs.stage_hunk,
      ['Undo stage hunk'] = gs.undo_stage_hunk,
      ['Reset hunk'] = gs.reset_hunk,
      ['Preview hunk'] = gs.preview_hunk,
      ['Blame line'] = gs.blame_line,
      ['Toggle blame'] = gs.toggle_current_line_blame,
      ['Diff this'] = gs.diffthis,
      ['Toggle deleted'] = gs.toggle_deleted,
      ['Next hunk'] = gs.next_hunk,
      ['Prev hunk'] = gs.prev_hunk,
      ['Stage buffer'] = gs.stage_buffer,
      ['Reset buffer'] = gs.reset_buffer,
    }

    local function gitsigns_picker()
      local fzf = require 'fzf-lua' -- lazy require

      local entries = vim.tbl_keys(actions)

      fzf.fzf_exec(entries, {
        prompt = 'Gitsigns> ',
        actions = {
          ['default'] = function(selected)
            if not selected or not selected[1] then
              return
            end

            local choice = selected[1]
            local fn = actions[choice]

            if fn then
              vim.schedule(fn)
            else
              vim.notify('Unknown Gitsigns action: ' .. choice)
            end
          end,
        },
      })
    end

    -- keymap
    vim.keymap.set('n', '<leader>gp', gitsigns_picker, {
      desc = 'Gitsigns picker',
    })
  end,
}
