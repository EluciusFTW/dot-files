return {
  'ibhagwan/fzf-lua',
  -- optional for icon support
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "echasnovski/mini.icons" },
  opts = {},
  config = function()
    vim.keymap.set('n', '<leader>fG', require('fzf-lua').global, { desc = '[F]ind [G]lobally' })
    vim.keymap.set('n', '<leader><leader>', require('fzf-lua').buffers, { desc = 'Open Buffers' })
    vim.keymap.set('n', '<leader>fq', require('fzf-lua').quickfix, { desc = '[F]ind [Q]uickfix' })
    vim.keymap.set('n', '<leader>fl', require('fzf-lua').loclist, { desc = '[F]ind [L]ocation' })
    vim.keymap.set('n', '<leader>ff', require('fzf-lua').files, { desc = '[F]ind [F]iles' })
    vim.keymap.set('n', '<leader>fg', require('fzf-lua').live_grep, { desc = '[F]ind [G]rep' })
    vim.keymap.set('n', '<leader>fw', require('fzf-lua').grep_cword, { desc = '[F]ind current [W]ord' })
    vim.keymap.set('n', '<leader>fj', require('fzf-lua').jumps, { desc = '[F]ind [J]umps' })
    vim.keymap.set('n', '<leader>/', require('fzf-lua').lgrep_curbuf, { desc = 'Fuzzy-find in current buffer' })
    vim.keymap.set('n', '<leader>fd', require('fzf-lua').diagnostics_document, { desc = '[F]ind [D]iagnostics in File' })
    vim.keymap.set('n', '<leader>fD', require('fzf-lua').diagnostics_workspace, { desc = '[F]ind [D]iagnostics in Workspace' })
    vim.keymap.set('n', '<leader>fk', require('fzf-lua').keymaps, { desc = '[F]earch [K]eymaps' })
    vim.keymap.set('n', '<leader>uc', require('fzf-lua').colorschemes, { desc = 'Colorscheme picker' })
    -- git
    vim.keymap.set('n', 'gh', require('fzf-lua').git_hunks, { desc = '[G]it [H]unks' })
    vim.keymap.set('n', 'gs', require('fzf-lua').git_status, { desc = '[G]it [S]tatus' })
  end,
}
