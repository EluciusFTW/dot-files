return {
  'ibhagwan/fzf-lua',
  dependencies = { 'echasnovski/mini.icons' },
  opts = {
    files = {
      formatter = 'path.filename_first', -- places file name first
    },
  },
  config = function()
    local fzf = require 'fzf-lua'
    vim.keymap.set('n', '<leader>fG', fzf.global, { desc = '[F]ind [G]lobally' })
    vim.keymap.set('n', '<leader><leader>', fzf.buffers, { desc = 'Open Buffers' })
    vim.keymap.set('n', '<leader>fq', fzf.quickfix, { desc = '[F]ind [Q]uickfix' })
    vim.keymap.set('n', '<leader>fl', fzf.loclist, { desc = '[F]ind [L]ocation' })
    vim.keymap.set('n', '<leader>ff', fzf.files, { desc = '[F]ind [F]iles' })
    vim.keymap.set('n', '<leader>fg', fzf.live_grep, { desc = '[F]ind [G]rep' })
    vim.keymap.set('n', '<leader>\\', fzf.live_grep, { desc = 'Global Grep' })
    vim.keymap.set('n', '<leader>fw', fzf.grep_cword, { desc = '[F]ind current [W]ord' })
    vim.keymap.set('n', '<leader>fj', fzf.jumps, { desc = '[F]ind [J]umps' })
    vim.keymap.set('n', '<leader>/', fzf.lgrep_curbuf, { desc = 'Fuzzy-find in current buffer' })
    vim.keymap.set('n', '<leader>fd', fzf.diagnostics_document, { desc = '[F]ind [D]iagnostics in File' })
    vim.keymap.set('n', '<leader>fD', fzf.diagnostics_workspace, { desc = '[F]ind [D]iagnostics in Workspace' })
    vim.keymap.set('n', '<leader>fk', fzf.keymaps, { desc = '[F]earch [K]eymaps' })
    vim.keymap.set('n', '<leader>uc', fzf.colorschemes, { desc = 'Colorscheme picker' })
    -- git
    vim.keymap.set('n', 'gh', fzf.git_hunks, { desc = '[G]it [H]unks' })
    vim.keymap.set('n', 'gs', fzf.git_status, { desc = '[G]it [S]tatus' })

    fzf.setup {
      defaults = {
        formatter = 'path.filename_first', -- places file name first
      },
    }
  end,
}
