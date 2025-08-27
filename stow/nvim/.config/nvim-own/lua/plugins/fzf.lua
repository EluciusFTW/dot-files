return {
  'ibhagwan/fzf-lua',
  -- optional for icon support
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "echasnovski/mini.icons" },
  opts = {},
  config = function()
    vim.keymap.set('n', '<leader>ff', require('fzf-lua').files, { desc = '[F]ind [F]iles' })
    vim.keymap.set('n', '<leader>fg', require('fzf-lua').live_grep, { desc = '[F]ind [G]rep' })
    vim.keymap.set('n', '<leader>fw', require('fzf-lua').grep_cword, { desc = '[F]ind current [W]ord' })
    vim.keymap.set('n', '<leader>fj', require('fzf-lua').jumps, { desc = '[F]ind [J]umps' })
    vim.keymap.set('n', '<leader>/', require('fzf-lua').lgrep_curbuf, { desc = 'Fuzzy-find in current buffer' })
    vim.keymap.set('n', '<leader>fd', require('fzf-lua').diagnostics_document, { desc = '[F]ind [D]iagnostics in File' })
    vim.keymap.set('n', '<leader>fD', require('fzf-lua').diagnostics_workspace, { desc = '[F]ind [D]iagnostics in Workspace' })
    vim.keymap.set('n', '<leader>fk', require('fzf-lua').keymaps, { desc = '[F]earch [K]eymaps' })
    vim.keymap.set('n', '<leader>uc', require('fzf-lua').colorschemes, { desc = 'Colorscheme picker' })
    -- copied

    -- vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    -- vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = '[S]earch [R]esume' })
    -- vim.keymap.set('n', '<leader>f.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    -- vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

    -- Shortcut for searching your Neovim configuration files
    -- vim.keymap.set('n', '<leader>sn', function()
    -- builtin.find_files { cwd = vim.fn.stdpath 'config' }
    -- end, { desc = '[S]earch [N]eovim files' })
  end,
}
